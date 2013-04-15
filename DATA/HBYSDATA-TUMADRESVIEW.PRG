***************** Begin View Definition TUMADRESVIEW ***************


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



CREATE SQL VIEW "TUMADRESVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Adres.Adres_Id,;
		Adres.Adres_Fk,;
		Rehber.Rehber_Id,;
		Rehber.Adi AS borclu_adi,;
		Adres.Adres_Tipi,;
		Adres.Adres,;
		Adres.Il_Adi,;
		Adres.Ilce_Adi,;
		Adres.Semt_Adi,;
		Adres.Posta_Kodu,;
		Adres.Ulke_Adi,;
		Adres.Adres_Statusu;
	FROM dbo.Adres Adres;
		INNER JOIN dbo.Rehber Rehber;
			ON Adres.Adres_Fk = Rehber.Rehber_Id;
	WHERE Adres.Adres_Fk IN (Select Borclu.Rehber_Id;
	FROM dbo.Borclu Borclu;
	WHERE Borclu.Borclu_Fk = ?vp_IcraDosya_Id)

DBSetProp('TUMADRESVIEW', 'View', 'UpdateType', 1)
DBSetProp('TUMADRESVIEW', 'View', 'WhereType', 3)
DBSetProp('TUMADRESVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TUMADRESVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('TUMADRESVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TUMADRESVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TUMADRESVIEW', 'View', 'Tables', 'dbo.Adres')
DBSetProp('TUMADRESVIEW', 'View', 'Prepared', .F.)
DBSetProp('TUMADRESVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TUMADRESVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TUMADRESVIEW', 'View', 'FetchSize', -1)
DBSetProp('TUMADRESVIEW', 'View', 'ParameterList', "vp_IcraDosya_Id,'C'")
DBSetProp('TUMADRESVIEW', 'View', 'Comment', "")
DBSetProp('TUMADRESVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TUMADRESVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TUMADRESVIEW
	GoExplorer.odbcx.Validate("TUMADRESVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW","VIEW",;
		"VFECDESCRIPT","TUMADRESVIEW Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_IcraDosya_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Icradosya Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for TUMADRESVIEW
*** Props for the TUMADRESVIEW.adres_id field.
DBSetProp('TUMADRESVIEW.adres_id', 'Field', 'KeyField', .T.)
DBSetProp('TUMADRESVIEW.adres_id', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.adres_id', 'Field', 'UpdateName', 'dbo.Adres.Adres_Id')
DBSetProp('TUMADRESVIEW.adres_id', 'Field', 'DataType', "C(36)")
DBSetProp('TUMADRESVIEW.adres_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TUMADRESVIEW.adres_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFECDESCRIPT","Adres Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFECFRMCAPTN","Adres ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFECDLGCAPTN","Adres ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFECGRDCAPTN","Adres ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFECRPTCAPTN","Adres ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFEMTOOLTIP","Adres ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFEMSTATUSTXT","Adres ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.adres_fk field.
DBSetProp('TUMADRESVIEW.adres_fk', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.adres_fk', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.adres_fk', 'Field', 'UpdateName', 'dbo.Adres.Adres_Fk')
DBSetProp('TUMADRESVIEW.adres_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TUMADRESVIEW.adres_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFECDESCRIPT","Adres Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFECFRMCAPTN","Adres FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFECDLGCAPTN","Adres FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFECGRDCAPTN","Adres FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFECRPTCAPTN","Adres FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFEMTOOLTIP","Adres FK                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFEMSTATUSTXT","Adres FK                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.rehber_id field.
DBSetProp('TUMADRESVIEW.rehber_id', 'Field', 'KeyField', .T.)
DBSetProp('TUMADRESVIEW.rehber_id', 'Field', 'Updatable', .F.)
DBSetProp('TUMADRESVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Rehber.Rehber_Id')
DBSetProp('TUMADRESVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TUMADRESVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.borclu_adi field.
DBSetProp('TUMADRESVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('TUMADRESVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Rehber.Adi')
DBSetProp('TUMADRESVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TUMADRESVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECLUTAG","borclu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.borclu_adi","FIELD",;
		"VFEMLUUPDFLDS","rehber_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the TUMADRESVIEW.adres_tipi field.
DBSetProp('TUMADRESVIEW.adres_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.adres_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.adres_tipi', 'Field', 'UpdateName', 'dbo.Adres.Adres_Tipi')
DBSetProp('TUMADRESVIEW.adres_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMADRESVIEW.adres_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECDESCRIPT","Adres Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECFRMCAPTN","Adres Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECDLGCAPTN","Adres Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECGRDCAPTN","Adres Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECRPTCAPTN","Adres Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFEMTOOLTIP","Adres Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFEMSTATUSTXT","Adres Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!adrestipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECLUTAG","adres_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFEMLUFIELDS","adres_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFEMLUUPDTEXP","Adrestipilookupview.adres_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.adres field.
DBSetProp('TUMADRESVIEW.adres', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.adres', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.adres', 'Field', 'UpdateName', 'dbo.Adres.Adres')
DBSetProp('TUMADRESVIEW.adres', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for TUMADRESVIEW.adres
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFECDESCRIPT","Adres Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFECFRMCAPTN","Adres") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFECDLGCAPTN","Adres") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFECGRDCAPTN","Adres") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFECRPTCAPTN","Adres") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFEMTOOLTIP","Adres") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFEMSTATUSTXT","Adres") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.il_adi field.
DBSetProp('TUMADRESVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.il_adi', 'Field', 'UpdateName', 'dbo.Adres.Il_Adi')
DBSetProp('TUMADRESVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMADRESVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.il_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.ilce_adi field.
DBSetProp('TUMADRESVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.Adres.Ilce_Adi')
DBSetProp('TUMADRESVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMADRESVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.semt_adi field.
DBSetProp('TUMADRESVIEW.semt_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.semt_adi', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.semt_adi', 'Field', 'UpdateName', 'dbo.Adres.Semt_Adi')
DBSetProp('TUMADRESVIEW.semt_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMADRESVIEW.semt_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFECDESCRIPT","Semt Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFECFRMCAPTN","Semt Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFECDLGCAPTN","Semt Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFECGRDCAPTN","Semt Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFECRPTCAPTN","Semt Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFEMTOOLTIP","Semt Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFEMSTATUSTXT","Semt Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.semt_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.posta_kodu field.
DBSetProp('TUMADRESVIEW.posta_kodu', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.posta_kodu', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.posta_kodu', 'Field', 'UpdateName', 'dbo.Adres.Posta_Kodu')
DBSetProp('TUMADRESVIEW.posta_kodu', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for TUMADRESVIEW.posta_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFECDESCRIPT","Posta Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFECFRMCAPTN","Posta Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFECDLGCAPTN","Posta Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFECGRDCAPTN","Posta Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFECRPTCAPTN","Posta Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFEMTOOLTIP","Posta Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFEMSTATUSTXT","Posta Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.posta_kodu","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.ulke_adi field.
DBSetProp('TUMADRESVIEW.ulke_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.ulke_adi', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.ulke_adi', 'Field', 'UpdateName', 'dbo.Adres.Ulke_Adi')
DBSetProp('TUMADRESVIEW.ulke_adi', 'Field', 'DataType', "C(15)")
DBSetProp('TUMADRESVIEW.ulke_adi', 'Field', 'DefaultValue', "'Türkiye'")
*** DBCX Field Properties for TUMADRESVIEW.ulke_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFECDESCRIPT","Ulke Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFECFRMCAPTN","Ülke Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFECDLGCAPTN","Ülke Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFECGRDCAPTN","Ülke Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFECRPTCAPTN","Ülke Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFEMTOOLTIP","Ülke Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFEMSTATUSTXT","Ülke Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.ulke_adi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the TUMADRESVIEW.adres_statusu field.
DBSetProp('TUMADRESVIEW.adres_statusu', 'Field', 'KeyField', .F.)
DBSetProp('TUMADRESVIEW.adres_statusu', 'Field', 'Updatable', .T.)
DBSetProp('TUMADRESVIEW.adres_statusu', 'Field', 'UpdateName', 'dbo.Adres.Adres_Statusu')
DBSetProp('TUMADRESVIEW.adres_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMADRESVIEW.adres_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECDESCRIPT","Adres Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECFRMCAPTN","Adres Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECDLGCAPTN","Adres Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECGRDCAPTN","Adres Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECRPTCAPTN","Adres Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFEMTOOLTIP","Adres Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFEMSTATUSTXT","Adres Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECLUTABLE","hbysdata!adresstatusulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECLUTAG","adres_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFEMLUFIELDS","adres_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFEMLUUPDTEXP","Adresstatusulookupview.adres_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMADRESVIEW.adres_statusu","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
