***************** Begin View Definition MUAMELEEDITVIEW ***************


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



CREATE SQL VIEW "MUAMELEEDITVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Muamele.Muamele_Id,;
		Muamele.Muamele_Fk,;
		Muamele.Borclu_Id,;
		Muamele.Borclu_Adi,;
		Muamele.Rehber_Id,;
		Muamele.Muamele_Tarihi,;
		Muamele.Muzekkere_Adi,;
		Muamele.Talep_Ifadesi,;
		Muamele.Masraf_Tipi,;
		Muamele.Masraf_Miktari,;
		Muamele.Mal_Tipi,;
				Muamele.Mal_Bilgisi,;
		Muamele.Muhatap_Adi,;
		Muamele.Muhatap_Adresi,;
		Muamele.Muamele_Statusu,;
		Muamele.Haciz_Sirasi,;
		Muamele.Haciz_Tarihi,;
		Muamele.Haciz_Miktari,;
		Muamele.Maas_Muvafakat_Miktari,;
		Muamele.Aciklama,;
		Muamele.Personel_Id,;
		Muamele.Personel_Adi,;
		Icradosya.IcraDosya_Id,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		CAST('' AS VARCHAR(250)) AS borclu_adresi,;
		Gonderi.Sonuc_Tarihi,;
		Gonderi.Sonuc_Bilgisi;
	FROM {oj dbo.Muamele Muamele;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Muamele.Muamele_Fk = Icradosya.IcraDosya_Id;
		LEFT OUTER JOIN dbo.Gonderi Gonderi;
			ON Muamele.Muamele_Id = Gonderi.Muamele_Id}

DBSetProp('MUAMELEEDITVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUAMELEEDITVIEW', 'View', 'WhereType', 3)
DBSetProp('MUAMELEEDITVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUAMELEEDITVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MUAMELEEDITVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUAMELEEDITVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUAMELEEDITVIEW', 'View', 'Tables', 'dbo.Muamele,dbo.Gonderi')
DBSetProp('MUAMELEEDITVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUAMELEEDITVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MUAMELEEDITVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUAMELEEDITVIEW', 'View', 'FetchSize', -1)
DBSetProp('MUAMELEEDITVIEW', 'View', 'ParameterList', "vp_Muamele_Id,'C'")
DBSetProp('MUAMELEEDITVIEW', 'View', 'Comment', "")
DBSetProp('MUAMELEEDITVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUAMELEEDITVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for MUAMELEEDITVIEW
	GoExplorer.odbcx.Validate("MUAMELEEDITVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW","VIEW",;
		"VFECDESCRIPT","Muameleeditview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Muamele_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MUAMELEEDITVIEW
*** Props for the MUAMELEEDITVIEW.muamele_id field.
DBSetProp('MUAMELEEDITVIEW.muamele_id', 'Field', 'KeyField', .T.)
DBSetProp('MUAMELEEDITVIEW.muamele_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.muamele_id', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Id')
DBSetProp('MUAMELEEDITVIEW.muamele_id', 'Field', 'DataType', "C(36)")
DBSetProp('MUAMELEEDITVIEW.muamele_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MUAMELEEDITVIEW.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele ID                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele ID                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.muamele_fk field.
DBSetProp('MUAMELEEDITVIEW.muamele_fk', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.muamele_fk', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.muamele_fk', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Fk')
DBSetProp('MUAMELEEDITVIEW.muamele_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEEDITVIEW.muamele_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFECDESCRIPT","Muamele Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFECFRMCAPTN","Muamele FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFECDLGCAPTN","Muamele FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFECGRDCAPTN","Muamele FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFECRPTCAPTN","Muamele FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFEMTOOLTIP","Muamele FK                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFEMSTATUSTXT","Muamele FK                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFECCLASS","ifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.borclu_id field.
DBSetProp('MUAMELEEDITVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.Muamele.Borclu_Id')
DBSetProp('MUAMELEEDITVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEEDITVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECLUTAG","borclu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_id","FIELD",;
		"VFEMLUUPDFLDS","borclu_adi, rehber_id, borclu_adresi") &&After Lookup Update Field List
ENDIF
 
*** Props for the MUAMELEEDITVIEW.borclu_adi field.
DBSetProp('MUAMELEEDITVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Muamele.Borclu_Adi')
DBSetProp('MUAMELEEDITVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEDITVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.rehber_id field.
DBSetProp('MUAMELEEDITVIEW.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Muamele.Rehber_Id')
DBSetProp('MUAMELEEDITVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEEDITVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.muamele_tarihi field.
DBSetProp('MUAMELEEDITVIEW.muamele_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.muamele_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.muamele_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Tarihi')
DBSetProp('MUAMELEEDITVIEW.muamele_tarihi', 'Field', 'DataType', "T")
DBSetProp('MUAMELEEDITVIEW.muamele_tarihi', 'Field', 'DefaultValue', "Datetime()")
*** DBCX Field Properties for MUAMELEEDITVIEW.muamele_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFECDESCRIPT","Muamele Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFECFRMCAPTN","Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFECDLGCAPTN","Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFECGRDCAPTN","Muamele Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFECRPTCAPTN","Muamele Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFEMTOOLTIP","Muamele Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFEMSTATUSTXT","Muamele Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_tarihi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.muzekkere_adi field.
DBSetProp('MUAMELEEDITVIEW.muzekkere_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.muzekkere_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.muzekkere_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muzekkere_Adi')
DBSetProp('MUAMELEEDITVIEW.muzekkere_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEDITVIEW.muzekkere_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECDESCRIPT","Muzekkere Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECFRMCAPTN","Müzekkere Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECDLGCAPTN","Müzekkere Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECGRDCAPTN","Müzekkere Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECRPTCAPTN","Müzekkere Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFEMTOOLTIP","Müzekkere Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFEMSTATUSTXT","Müzekkere Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECLUTABLE","hbysdata!muameletipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECLUTAG","rapor_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFEMLUFIELDS","rapor_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFEMLUUPDTEXP","Muameletipilookupview.rapor_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECCLASS","muzekkereadifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muzekkere_adi","FIELD",;
		"VFEMLUUPDFLDS","talep_ifadesi") &&After Lookup Update Field List
ENDIF
 
*** Props for the MUAMELEEDITVIEW.talep_ifadesi field.
DBSetProp('MUAMELEEDITVIEW.talep_ifadesi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.talep_ifadesi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.talep_ifadesi', 'Field', 'UpdateName', 'dbo.Muamele.Talep_Ifadesi')
DBSetProp('MUAMELEEDITVIEW.talep_ifadesi', 'Field', 'DataType', "M")
*** DBCX Field Properties for MUAMELEEDITVIEW.talep_ifadesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFECDESCRIPT","Talep Ifadesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFECFRMCAPTN","Talep Ýfadesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFECDLGCAPTN","Talep Ýfadesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFECGRDCAPTN","Talep Ýfadesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFECRPTCAPTN","Talep Ýfadesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFEMTOOLTIP","Talep Ýfadesi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFEMSTATUSTXT","Talep Ýfadesi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.talep_ifadesi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.masraf_tipi field.
DBSetProp('MUAMELEEDITVIEW.masraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.masraf_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.masraf_tipi', 'Field', 'UpdateName', 'dbo.Muamele.Masraf_Tipi')
DBSetProp('MUAMELEEDITVIEW.masraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEEDITVIEW.masraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECDESCRIPT","Masraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!masraftipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECLUTAG","masraf_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFEMLUFIELDS","masraf_tipi, masraf_miktari") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFEMLUUPDTEXP","Masraftipilookupview.masraf_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECCLASS","afieldnovalidateduringsave") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_tipi","FIELD",;
		"VFEMLUUPDFLDS","masraf_miktari") &&After Lookup Update Field List
ENDIF
 
*** Props for the MUAMELEEDITVIEW.masraf_miktari field.
DBSetProp('MUAMELEEDITVIEW.masraf_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.masraf_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.masraf_miktari', 'Field', 'UpdateName', 'dbo.Muamele.Masraf_Miktari')
DBSetProp('MUAMELEEDITVIEW.masraf_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MUAMELEEDITVIEW.masraf_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFECDESCRIPT","Masraf Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFECFRMCAPTN","Masraf Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFECDLGCAPTN","Masraf Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFECGRDCAPTN","Masraf Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFECRPTCAPTN","Masraf Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFEMTOOLTIP","Masraf Miktarý                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFEMSTATUSTXT","Masraf Miktarý                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.masraf_miktari","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the MUAMELEEDITVIEW.mal_tipi field.
DBSetProp('MUAMELEEDITVIEW.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.mal_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.mal_tipi', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Tipi')
DBSetProp('MUAMELEEDITVIEW.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEEDITVIEW.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!maltipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECLUTAG","mal_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFEMLUFIELDS","mal_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFEMLUUPDTEXP","Maltipilookupview.mal_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.mal_tipi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.muhatap_adi field.
DBSetProp('MUAMELEEDITVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adi')
DBSetProp('MUAMELEEDITVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEDITVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.muhatap_adresi field.
DBSetProp('MUAMELEEDITVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adresi')
DBSetProp('MUAMELEEDITVIEW.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MUAMELEEDITVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.muamele_statusu field.
DBSetProp('MUAMELEEDITVIEW.muamele_statusu', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.muamele_statusu', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.muamele_statusu', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Statusu')
DBSetProp('MUAMELEEDITVIEW.muamele_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEEDITVIEW.muamele_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFECDESCRIPT","Muamele Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFECFRMCAPTN","Muamele Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFECDLGCAPTN","Muamele Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFECGRDCAPTN","Muamele Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFECRPTCAPTN","Muamele Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFEMTOOLTIP","Muamele Statüsü                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFEMSTATUSTXT","Muamele Statüsü                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.muamele_statusu","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.haciz_sirasi field.
DBSetProp('MUAMELEEDITVIEW.haciz_sirasi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.haciz_sirasi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEDITVIEW.haciz_sirasi', 'Field', 'UpdateName', 'Haciz_Sirasi')
DBSetProp('MUAMELEEDITVIEW.haciz_sirasi', 'Field', 'DataType', "I")
*** DBCX Field Properties for MUAMELEEDITVIEW.haciz_sirasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFECDESCRIPT","Haciz Sirasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFECFRMCAPTN","Haciz Sirasi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFECDLGCAPTN","Haciz Sirasi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFECGRDCAPTN","Haciz Sirasi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFECRPTCAPTN","Haciz Sirasi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFEMTOOLTIP","Haciz Sirasi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFEMSTATUSTXT","Haciz Sirasi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_sirasi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.haciz_tarihi field.
DBSetProp('MUAMELEEDITVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.haciz_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Haciz_Tarihi')
DBSetProp('MUAMELEEDITVIEW.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUAMELEEDITVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.haciz_miktari field.
DBSetProp('MUAMELEEDITVIEW.haciz_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.haciz_miktari', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEDITVIEW.haciz_miktari', 'Field', 'UpdateName', 'Haciz_Miktari')
DBSetProp('MUAMELEEDITVIEW.haciz_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MUAMELEEDITVIEW.haciz_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFECDESCRIPT","Haciz Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFECFRMCAPTN","Haciz Miktari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFECDLGCAPTN","Haciz Miktari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFECGRDCAPTN","Haciz Miktari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFECRPTCAPTN","Haciz Miktari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFEMTOOLTIP","Haciz Miktari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFEMSTATUSTXT","Haciz Miktari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.haciz_miktari","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.maas_muvafakat_miktari field.
DBSetProp('MUAMELEEDITVIEW.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.maas_muvafakat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.Muamele.Maas_Muvafakat_Miktari')
DBSetProp('MUAMELEEDITVIEW.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MUAMELEEDITVIEW.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Maaþ Muvafakat") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Maaþ Muvafakat") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Maaþ Muvafakat") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Maaþ Muvafakat") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Maaþ Muvafakat                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Maaþ Muvafakat                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",17) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the MUAMELEEDITVIEW.aciklama field.
DBSetProp('MUAMELEEDITVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.aciklama', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEDITVIEW.aciklama', 'Field', 'UpdateName', 'Aciklama')
DBSetProp('MUAMELEEDITVIEW.aciklama', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for MUAMELEEDITVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Aciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Aciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Aciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Aciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Aciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Aciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.aciklama","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.personel_id field.
DBSetProp('MUAMELEEDITVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Muamele.Personel_Id')
DBSetProp('MUAMELEEDITVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEEDITVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_id","FIELD",;
		"VFEMLUUPDFLDS","personel_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the MUAMELEEDITVIEW.personel_adi field.
DBSetProp('MUAMELEEDITVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Muamele.Personel_Adi')
DBSetProp('MUAMELEEDITVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEDITVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the MUAMELEEDITVIEW.icradosya_id field.
DBSetProp('MUAMELEEDITVIEW.icradosya_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEDITVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('MUAMELEEDITVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEEDITVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","ÝcraDosya ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","ÝcraDosya ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","ÝcraDosya ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","ÝcraDosya ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","ÝcraDosya ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","ÝcraDosya ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.buro_dosya_no field.
DBSetProp('MUAMELEEDITVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEDITVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('MUAMELEEDITVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for MUAMELEEDITVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Uro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Uro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Uro Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Uro Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Uro Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Uro Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.icra_dosya_no field.
DBSetProp('MUAMELEEDITVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEDITVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('MUAMELEEDITVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEEDITVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Cra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Cra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Cra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Cra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Cra Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Cra Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.borclu_adresi field.
DBSetProp('MUAMELEEDITVIEW.borclu_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.borclu_adresi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEDITVIEW.borclu_adresi', 'Field', 'UpdateName', 'Borclu_Adresi')
DBSetProp('MUAMELEEDITVIEW.borclu_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MUAMELEEDITVIEW.borclu_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFECDESCRIPT","Borclu Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adresi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adresi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.borclu_adresi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.sonuc_tarihi field.
DBSetProp('MUAMELEEDITVIEW.sonuc_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.sonuc_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.sonuc_tarihi', 'Field', 'UpdateName', 'dbo.Gonderi.Sonuc_Tarihi')
DBSetProp('MUAMELEEDITVIEW.sonuc_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUAMELEEDITVIEW.sonuc_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFECDESCRIPT","Sonuc Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFECFRMCAPTN","Tebliðat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFECDLGCAPTN","Tebliðat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFECGRDCAPTN","Tebliðat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFECRPTCAPTN","Tebliðat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFEMTOOLTIP","Tebliðat Tarihi                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFEMSTATUSTXT","Tebliðat Tarihi                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFELREADONLY",.T.) &&Read Only
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_tarihi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the MUAMELEEDITVIEW.sonuc_bilgisi field.
DBSetProp('MUAMELEEDITVIEW.sonuc_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEDITVIEW.sonuc_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEDITVIEW.sonuc_bilgisi', 'Field', 'UpdateName', 'dbo.Gonderi.Sonuc_Bilgisi')
DBSetProp('MUAMELEEDITVIEW.sonuc_bilgisi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEEDITVIEW.sonuc_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFECDESCRIPT","Sonuc Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFECFRMCAPTN","Tebliðat Sonucu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFECDLGCAPTN","Tebliðat Sonucu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFECGRDCAPTN","Tebliðat Sonucu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFECRPTCAPTN","Tebliðat Sonucu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFEMTOOLTIP","Tebliðat Sonucu                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Tebliðat Sonucu                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFELREADONLY",.T.) &&Read Only
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEDITVIEW.sonuc_bilgisi","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
