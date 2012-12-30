***************** Begin View Definition MUAMELEEVRAKLARIVIEW ***************


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



CREATE SQL VIEW "MUAMELEEVRAKLARIVIEW" ; 
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
		Muamele.Muamele_Statusu,;
		Muamele.Personel_Id,;
		Muamele.Personel_Adi,;
		Muamele.Mal_Bilgisi,;
		Muamele.Muhatap_Adi,;
		Muamele.Muhatap_Adresi,;
		Muamele.Haciz_Tarihi,;
		Muamele.Maas_Muvafakat_Miktari,;
		CAST(0 AS BIT) AS lmuzekkerebas,;
		CAST(1 AS BIT) AS lzarfbas,;
		SPACE(50) AS zarf_adi,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Borc_Tipi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Adliye_Adi;
	FROM dbo.Muamele Muamele;
		INNER JOIN dbo.Icradosya Icradosya;
			ON Muamele.Muamele_Fk = Icradosya.IcraDosya_Id

DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'WhereType', 3)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'Tables', 'dbo.Muamele')
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'FetchSize', -1)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'ParameterList', "vp_Muamele_Fk,'C';vp_Muzekkere_Adi,'C';vp_Borclu_Id,'C'")
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'Comment', "")
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUAMELEEVRAKLARIVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for MUAMELEEVRAKLARIVIEW
	GoExplorer.odbcx.Validate("MUAMELEEVRAKLARIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW","VIEW",;
		"VFECDESCRIPT","MuameleEvraklariView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Muamele_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFECFRMCAPTN","Muamele Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFECDLGCAPTN","Muamele Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFEMTOOLTIP","Muamele Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Muamele_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muamele_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muzekkere_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muzekkere Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müzekkere Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müzekkere Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müzekkere Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müzekkere Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Muzekkere_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Borclu_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Borclu Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFECFRMCAPTN","Borclu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFECDLGCAPTN","Borclu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFEMTOOLTIP","Borclu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFEMSTATUSTXT","Borclu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.vp_Borclu_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!muameleevraklariview.muamltarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!muameleevraklariview","muamltarh","MUAMELE_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muameleevraklariview.muamltarh","INDEX",;
		"VFECDESCRIPT","Muamltarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muameleevraklariview.muamltarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muameleevraklariview.muamltarh","INDEX",;
		"VFECTAGCAPTN","Muamltarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muameleevraklariview.muamltarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for MUAMELEEVRAKLARIVIEW
*** Props for the MUAMELEEVRAKLARIVIEW.muamele_id field.
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_id', 'Field', 'KeyField', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_id', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Id')
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_id', 'Field', 'DataType', "C(36)")
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele ID                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele ID                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.muamele_fk field.
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_fk', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_fk', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_fk', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Fk')
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.muamele_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFECDESCRIPT","Muamele Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFECFRMCAPTN","Muamele FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFECDLGCAPTN","Muamele FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFECGRDCAPTN","Muamele FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFECRPTCAPTN","Muamele FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFEMTOOLTIP","Muamele FK                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFEMSTATUSTXT","Muamele FK                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.borclu_id field.
DBSetProp('MUAMELEEVRAKLARIVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.Muamele.Borclu_Id')
DBSetProp('MUAMELEEVRAKLARIVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.borclu_adi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Muamele.Borclu_Adi')
DBSetProp('MUAMELEEVRAKLARIVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.rehber_id field.
DBSetProp('MUAMELEEVRAKLARIVIEW.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Muamele.Rehber_Id')
DBSetProp('MUAMELEEVRAKLARIVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.muamele_tarihi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Tarihi')
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_tarihi', 'Field', 'DataType', "T")
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_tarihi', 'Field', 'DefaultValue', "datetime()")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.muamele_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFECDESCRIPT","Muamele Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFECFRMCAPTN","Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFECDLGCAPTN","Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFECGRDCAPTN","Muamele Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFECRPTCAPTN","Muamele Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFEMTOOLTIP","Muamele Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFEMSTATUSTXT","Muamele Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFECQFINDTAG","muamltarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_tarihi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.muzekkere_adi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.muzekkere_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muzekkere_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muzekkere_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muzekkere_Adi')
DBSetProp('MUAMELEEVRAKLARIVIEW.muzekkere_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.muzekkere_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFECDESCRIPT","Muzekkere Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFECFRMCAPTN","Müzekkere Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFECDLGCAPTN","Müzekkere Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFECGRDCAPTN","Müzekkere Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFECRPTCAPTN","Müzekkere Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFEMTOOLTIP","Müzekkere Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFEMSTATUSTXT","Müzekkere Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muzekkere_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.talep_ifadesi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.talep_ifadesi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.talep_ifadesi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.talep_ifadesi', 'Field', 'UpdateName', 'dbo.Muamele.Talep_Ifadesi')
DBSetProp('MUAMELEEVRAKLARIVIEW.talep_ifadesi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.talep_ifadesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFECDESCRIPT","Talep Ifadesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFECFRMCAPTN","Talep Ýfadesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFECDLGCAPTN","Talep Ýfadesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFECGRDCAPTN","Talep Ýfadesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFECRPTCAPTN","Talep Ýfadesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFEMTOOLTIP","Talep Ýfadesi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFEMSTATUSTXT","Talep Ýfadesi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.talep_ifadesi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.masraf_tipi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.masraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.masraf_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.masraf_tipi', 'Field', 'UpdateName', 'dbo.Muamele.Masraf_Tipi')
DBSetProp('MUAMELEEVRAKLARIVIEW.masraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.masraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFECDESCRIPT","Masraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_tipi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.masraf_miktari field.
DBSetProp('MUAMELEEVRAKLARIVIEW.masraf_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.masraf_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.masraf_miktari', 'Field', 'UpdateName', 'dbo.Muamele.Masraf_Miktari')
DBSetProp('MUAMELEEVRAKLARIVIEW.masraf_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.masraf_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFECDESCRIPT","Masraf Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFECFRMCAPTN","Masraf Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFECDLGCAPTN","Masraf Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFECGRDCAPTN","Masraf Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFECRPTCAPTN","Masraf Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFEMTOOLTIP","Masraf Miktarý                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFEMSTATUSTXT","Masraf Miktarý                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.masraf_miktari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.muamele_statusu field.
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_statusu', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_statusu', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_statusu', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Statusu')
DBSetProp('MUAMELEEVRAKLARIVIEW.muamele_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.muamele_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFECDESCRIPT","Muamele Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFECFRMCAPTN","Muamele Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFECDLGCAPTN","Muamele Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFECGRDCAPTN","Muamele Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFECRPTCAPTN","Muamele Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFEMTOOLTIP","Muamele Statüsü                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFEMSTATUSTXT","Muamele Statüsü                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muamele_statusu","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.personel_id field.
DBSetProp('MUAMELEEVRAKLARIVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Muamele.Personel_Id')
DBSetProp('MUAMELEEVRAKLARIVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.personel_adi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Muamele.Personel_Adi')
DBSetProp('MUAMELEEVRAKLARIVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.mal_bilgisi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.mal_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.mal_bilgisi', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Bilgisi')
DBSetProp('MUAMELEEVRAKLARIVIEW.mal_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.mal_bilgisi","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.muhatap_adi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adi')
DBSetProp('MUAMELEEVRAKLARIVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.muhatap_adresi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adresi')
DBSetProp('MUAMELEEVRAKLARIVIEW.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.haciz_tarihi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.haciz_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Haciz_Tarihi')
DBSetProp('MUAMELEEVRAKLARIVIEW.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari field.
DBSetProp('MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.Muamele.Maas_Muvafakat_Miktari')
DBSetProp('MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Maas Muvafakat Miktari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Maas Muvafakat Miktari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Maas Muvafakat Miktari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Maas Muvafakat Miktari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Maas Muvafakat Miktari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Maas Muvafakat Miktari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.lmuzekkerebas field.
DBSetProp('MUAMELEEVRAKLARIVIEW.lmuzekkerebas', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.lmuzekkerebas', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.lmuzekkerebas', 'Field', 'UpdateName', 'lMuzekkereBas')
DBSetProp('MUAMELEEVRAKLARIVIEW.lmuzekkerebas', 'Field', 'DataType', "L")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.lmuzekkerebas
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFECDESCRIPT","Lmuzekkerebas Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFECFRMCAPTN","Müzekkere Bas") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFECDLGCAPTN","Müzekkere Bas") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFECGRDCAPTN","Müzekkere Bas") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFECRPTCAPTN","Müzekkere Bas") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFEMTOOLTIP","Müzekkere Bas                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFEMSTATUSTXT","Müzekkere Bas                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lmuzekkerebas","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the MUAMELEEVRAKLARIVIEW.lzarfbas field.
DBSetProp('MUAMELEEVRAKLARIVIEW.lzarfbas', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.lzarfbas', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.lzarfbas', 'Field', 'UpdateName', 'lZarfBas')
DBSetProp('MUAMELEEVRAKLARIVIEW.lzarfbas', 'Field', 'DataType', "L")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.lzarfbas
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFECDESCRIPT","Lzarfbas Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFECFRMCAPTN","Zarf Bas") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFECDLGCAPTN","Zarf Bas") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFECGRDCAPTN","Zarf Bas") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFECRPTCAPTN","Zarf Bas") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFEMTOOLTIP","Zarf Bas                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFEMSTATUSTXT","Zarf Bas                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.lzarfbas","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.zarf_adi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.zarf_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.zarf_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.zarf_adi', 'Field', 'UpdateName', 'Zarf_Adi')
DBSetProp('MUAMELEEVRAKLARIVIEW.zarf_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.zarf_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECDESCRIPT","Zarf Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECFRMCAPTN","Zarf Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECDLGCAPTN","Zarf Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECGRDCAPTN","Zarf Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECRPTCAPTN","Zarf Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFEMTOOLTIP","Zarf Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFEMSTATUSTXT","Zarf Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECLUTABLE","hbysdata!zarftipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECLUTAG","rapor_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFEMLUFIELDS","rapor_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFEMLUUPDTEXP","Zarftipilookupview.rapor_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.zarf_adi","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.icra_dosya_no field.
DBSetProp('MUAMELEEVRAKLARIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.Icradosya.Icra_Dosya_No')
DBSetProp('MUAMELEEVRAKLARIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Icra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Icra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Icra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Icra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Icra Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Icra Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.buro_dosya_no field.
DBSetProp('MUAMELEEVRAKLARIVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.Icradosya.Buro_Dosya_No')
DBSetProp('MUAMELEEVRAKLARIVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Buro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Buro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Buro Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Buro Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Buro Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Buro Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.muvekkil_adi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Icradosya.Muvekkil_Adi')
DBSetProp('MUAMELEEVRAKLARIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Muvekkil Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Muvekkil Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Muvekkil Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Muvekkil Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Muvekkil Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.dosya_tipi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.dosya_tipi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.Icradosya.Dosya_Tipi')
DBSetProp('MUAMELEEVRAKLARIVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.borc_tipi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.Icradosya.Borc_Tipi')
DBSetProp('MUAMELEEVRAKLARIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borc Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borc Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borc Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borc Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borc Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borc Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.icramudurlugu_adi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.Icradosya.IcraMudurlugu_Adi')
DBSetProp('MUAMELEEVRAKLARIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the MUAMELEEVRAKLARIVIEW.adliye_adi field.
DBSetProp('MUAMELEEVRAKLARIVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.adliye_adi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELEEVRAKLARIVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.Icradosya.Adliye_Adi')
DBSetProp('MUAMELEEVRAKLARIVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELEEVRAKLARIVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELEEVRAKLARIVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
