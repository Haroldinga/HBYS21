***************** Begin View Definition TUMILETISIMVIEW ***************


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



CREATE SQL VIEW "TUMILETISIMVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Iletisim.Iletisim_Id,;
		Iletisim.Iletisim_Fk,;
		Rehber.Rehber_Id,;
		Rehber.Adi AS borclu_adi,;
		Iletisim.Adi_Soyadi,;
		Iletisim.Gorevi,;
		Iletisim.Yakinligi,;
		Iletisim.Telefon_Tipi,;
		Iletisim.Ulke_Kodu,;
		Iletisim.Telefon_No,;
		Iletisim.Dahili_No,;
		Iletisim.Telefon_Statusu,;
		Iletisim.e_Posta,;
		Iletisim.Notlar;
	FROM dbo.Iletisim Iletisim;
		INNER JOIN dbo.Rehber Rehber;
			ON Iletisim.Iletisim_Fk = Rehber.Rehber_Id;
	WHERE Iletisim.Iletisim_Fk IN (Select Borclu.Rehber_Id;
	FROM dbo.Borclu Borclu;
	WHERE Borclu.Borclu_Fk = ?vp_IcraDosya_Id)

DBSetProp('TUMILETISIMVIEW', 'View', 'UpdateType', 1)
DBSetProp('TUMILETISIMVIEW', 'View', 'WhereType', 3)
DBSetProp('TUMILETISIMVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TUMILETISIMVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('TUMILETISIMVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TUMILETISIMVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TUMILETISIMVIEW', 'View', 'Tables', 'dbo.Iletisim')
DBSetProp('TUMILETISIMVIEW', 'View', 'Prepared', .F.)
DBSetProp('TUMILETISIMVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('TUMILETISIMVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TUMILETISIMVIEW', 'View', 'FetchSize', -1)
DBSetProp('TUMILETISIMVIEW', 'View', 'ParameterList', "vp_IcraDosya_Id,'C'")
DBSetProp('TUMILETISIMVIEW', 'View', 'Comment', "")
DBSetProp('TUMILETISIMVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TUMILETISIMVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TUMILETISIMVIEW
	GoExplorer.odbcx.Validate("TUMILETISIMVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW","VIEW",;
		"VFECDESCRIPT","TUMILETISIMVIEW Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_IcraDosya_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Icradosya Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for TUMILETISIMVIEW
*** Props for the TUMILETISIMVIEW.iletisim_id field.
DBSetProp('TUMILETISIMVIEW.iletisim_id', 'Field', 'KeyField', .T.)
DBSetProp('TUMILETISIMVIEW.iletisim_id', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.iletisim_id', 'Field', 'UpdateName', 'dbo.Iletisim.Iletisim_Id')
DBSetProp('TUMILETISIMVIEW.iletisim_id', 'Field', 'DataType', "C(36)")
DBSetProp('TUMILETISIMVIEW.iletisim_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TUMILETISIMVIEW.iletisim_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFECDESCRIPT","Iletisim Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFECFRMCAPTN","Ýletiþim ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFECDLGCAPTN","Ýletiþim ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFECGRDCAPTN","Ýletiþim ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFECRPTCAPTN","Ýletiþim ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFEMTOOLTIP","Ýletiþim ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFEMSTATUSTXT","Ýletiþim ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.iletisim_fk field.
DBSetProp('TUMILETISIMVIEW.iletisim_fk', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.iletisim_fk', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.iletisim_fk', 'Field', 'UpdateName', 'dbo.Iletisim.Iletisim_Fk')
DBSetProp('TUMILETISIMVIEW.iletisim_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TUMILETISIMVIEW.iletisim_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECDESCRIPT","Iletisim Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECFRMCAPTN","Ýletiþim FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECDLGCAPTN","Ýletiþim FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECGRDCAPTN","Ýletiþim FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECRPTCAPTN","Ýletiþim FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFEMTOOLTIP","Ýletiþim FK                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFEMSTATUSTXT","Ýletiþim FK                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.iletisim_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.rehber_id field.
DBSetProp('TUMILETISIMVIEW.rehber_id', 'Field', 'KeyField', .T.)
DBSetProp('TUMILETISIMVIEW.rehber_id', 'Field', 'Updatable', .F.)
DBSetProp('TUMILETISIMVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Rehber.Rehber_Id')
DBSetProp('TUMILETISIMVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TUMILETISIMVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.borclu_adi field.
DBSetProp('TUMILETISIMVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('TUMILETISIMVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Rehber.Adi')
DBSetProp('TUMILETISIMVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TUMILETISIMVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECLUTAG","borclu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.borclu_adi","FIELD",;
		"VFEMLUUPDFLDS","rehber_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the TUMILETISIMVIEW.adi_soyadi field.
DBSetProp('TUMILETISIMVIEW.adi_soyadi', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.adi_soyadi', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.adi_soyadi', 'Field', 'UpdateName', 'dbo.Iletisim.Adi_Soyadi')
DBSetProp('TUMILETISIMVIEW.adi_soyadi', 'Field', 'DataType', "C(50)")
DBSetProp('TUMILETISIMVIEW.adi_soyadi', 'Field', 'DefaultValue', "'Kendisi'")
*** DBCX Field Properties for TUMILETISIMVIEW.adi_soyadi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECDESCRIPT","Adi Soyadi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECFRMCAPTN","Telefon Sahibi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECDLGCAPTN","Telefon Sahibi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECGRDCAPTN","Telefon Sahibi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECRPTCAPTN","Telefon Sahibi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFEMTOOLTIP","Telefon Sahibi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFEMSTATUSTXT","Telefon Sahibi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.adi_soyadi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.gorevi field.
DBSetProp('TUMILETISIMVIEW.gorevi', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.gorevi', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.gorevi', 'Field', 'UpdateName', 'dbo.Iletisim.Gorevi')
DBSetProp('TUMILETISIMVIEW.gorevi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TUMILETISIMVIEW.gorevi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFECDESCRIPT","Gorevi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFECFRMCAPTN","Yakýnýnýn Görevi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFECDLGCAPTN","Yakýnýnýn Görevi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFECGRDCAPTN","Yakýnýnýn Görevi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFECRPTCAPTN","Yakýnýnýn Görevi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFEMTOOLTIP","Yakýnýnýn Görevi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFEMSTATUSTXT","Yakýnýnýn Görevi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.gorevi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.yakinligi field.
DBSetProp('TUMILETISIMVIEW.yakinligi', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.yakinligi', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.yakinligi', 'Field', 'UpdateName', 'dbo.Iletisim.Yakinligi')
DBSetProp('TUMILETISIMVIEW.yakinligi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TUMILETISIMVIEW.yakinligi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFECDESCRIPT","Yakinligi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFECFRMCAPTN","Yakýnlýðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFECDLGCAPTN","Yakýnlýðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFECGRDCAPTN","Yakýnlýðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFECRPTCAPTN","Yakýnlýðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFEMTOOLTIP","Yakýnlýðý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFEMSTATUSTXT","Yakýnlýðý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.yakinligi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.telefon_tipi field.
DBSetProp('TUMILETISIMVIEW.telefon_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.telefon_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.telefon_tipi', 'Field', 'UpdateName', 'dbo.Iletisim.Telefon_Tipi')
DBSetProp('TUMILETISIMVIEW.telefon_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMILETISIMVIEW.telefon_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECDESCRIPT","Telefon Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECFRMCAPTN","Telefon Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECDLGCAPTN","Telefon Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECGRDCAPTN","Telefon Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECRPTCAPTN","Telefon Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMTOOLTIP","Telefon Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMSTATUSTXT","Telefon Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!telefontipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECLUTAG","telefon_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMLUFIELDS","telefon_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMLUUPDTEXP","Telefontipilookupview.telefon_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_tipi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.ulke_kodu field.
DBSetProp('TUMILETISIMVIEW.ulke_kodu', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.ulke_kodu', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.ulke_kodu', 'Field', 'UpdateName', 'dbo.Iletisim.Ulke_Kodu')
DBSetProp('TUMILETISIMVIEW.ulke_kodu', 'Field', 'DataType', "C(3)")
DBSetProp('TUMILETISIMVIEW.ulke_kodu', 'Field', 'DefaultValue', "'90'")
*** DBCX Field Properties for TUMILETISIMVIEW.ulke_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECDESCRIPT","Ulke Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECFRMCAPTN","Ülke Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECDLGCAPTN","Ülke Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECGRDCAPTN","Ülke Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECRPTCAPTN","Ülke Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFEMTOOLTIP","Ülke Kodu                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFEMSTATUSTXT","Ülke Kodu                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.ulke_kodu","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.telefon_no field.
DBSetProp('TUMILETISIMVIEW.telefon_no', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.telefon_no', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.telefon_no', 'Field', 'UpdateName', 'dbo.Iletisim.Telefon_No')
DBSetProp('TUMILETISIMVIEW.telefon_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMILETISIMVIEW.telefon_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFECDESCRIPT","Telefon No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFECFRMCAPTN","Telefon No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFECDLGCAPTN","Telefon No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFECGRDCAPTN","Telefon No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFECRPTCAPTN","Telefon No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFEMTOOLTIP","Telefon No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFEMSTATUSTXT","Telefon No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the TUMILETISIMVIEW.dahili_no field.
DBSetProp('TUMILETISIMVIEW.dahili_no', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.dahili_no', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.dahili_no', 'Field', 'UpdateName', 'dbo.Iletisim.Dahili_No')
DBSetProp('TUMILETISIMVIEW.dahili_no', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for TUMILETISIMVIEW.dahili_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFECDESCRIPT","Dahili No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFECFRMCAPTN","Dahili No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFECDLGCAPTN","Dahili No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFECGRDCAPTN","Dahili No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFECRPTCAPTN","Dahili No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFEMTOOLTIP","Dahili No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFEMSTATUSTXT","Dahili No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.dahili_no","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.telefon_statusu field.
DBSetProp('TUMILETISIMVIEW.telefon_statusu', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.telefon_statusu', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.telefon_statusu', 'Field', 'UpdateName', 'dbo.Iletisim.Telefon_Statusu')
DBSetProp('TUMILETISIMVIEW.telefon_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMILETISIMVIEW.telefon_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECDESCRIPT","Telefon Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECFRMCAPTN","Telefon Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECDLGCAPTN","Telefon Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECGRDCAPTN","Telefon Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECRPTCAPTN","Telefon Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMTOOLTIP","Telefon Statüsü                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMSTATUSTXT","Telefon Statüsü                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECLUTABLE","hbysdata!telefonstatusulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECLUTAG","telefon_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMLUFIELDS","telefon_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMLUUPDTEXP","Telefonstatusulookupview.telefon_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.telefon_statusu","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.e_posta field.
DBSetProp('TUMILETISIMVIEW.e_posta', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.e_posta', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.e_posta', 'Field', 'UpdateName', 'dbo.Iletisim.e_Posta')
DBSetProp('TUMILETISIMVIEW.e_posta', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TUMILETISIMVIEW.e_posta
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFECDESCRIPT","E Posta Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFECFRMCAPTN","ePosta") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFECDLGCAPTN","ePosta") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFECGRDCAPTN","ePosta") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFECRPTCAPTN","ePosta") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFEMTOOLTIP","ePosta                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFEMSTATUSTXT","ePosta                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.e_posta","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the TUMILETISIMVIEW.notlar field.
DBSetProp('TUMILETISIMVIEW.notlar', 'Field', 'KeyField', .F.)
DBSetProp('TUMILETISIMVIEW.notlar', 'Field', 'Updatable', .T.)
DBSetProp('TUMILETISIMVIEW.notlar', 'Field', 'UpdateName', 'dbo.Iletisim.Notlar')
DBSetProp('TUMILETISIMVIEW.notlar', 'Field', 'DataType', "M")
*** DBCX Field Properties for TUMILETISIMVIEW.notlar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFECDESCRIPT","Notlar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFECFRMCAPTN","Notlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFECDLGCAPTN","Notlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFECGRDCAPTN","Notlar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFECRPTCAPTN","Notlar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFEMTOOLTIP","Notlar") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFEMSTATUSTXT","Notlar") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMILETISIMVIEW.notlar","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
