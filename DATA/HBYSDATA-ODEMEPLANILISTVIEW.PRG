***************** Begin View Definition ODEMEPLANILISTVIEW ***************


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



CREATE SQL VIEW "ODEMEPLANILISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Odemeplani.OdemePlani_Id,;
		Odemeplani.OdemePlani_Fk,;
		Odemeplani.Borclu_Id,;
		Odemeplani.Borclu_Adi,;
		Odemeplani.Odeme_Tarihi,;
		Odemeplani.Odeme_Miktari,;
		Odemeplani.Odeme_Sonucu,;
		Odemeplani.Aciklama;
	FROM dbo.OdemePlani Odemeplani

DBSetProp('ODEMEPLANILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'Tables', 'dbo.OdemePlani')
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'ParameterList', "vp_OdemePlani_Fk,'C'")
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'Comment', "")
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ODEMEPLANILISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ODEMEPLANILISTVIEW
	GoExplorer.odbcx.Validate("ODEMEPLANILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW","VIEW",;
		"VFECDESCRIPT","Odemeplanilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_OdemePlani_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Odemeplani Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFECFRMCAPTN","Odemeplani Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFECDLGCAPTN","Odemeplani Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFEMTOOLTIP","Odemeplani Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Odemeplani Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFEMCOMPARETO","OdemePlani_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.vp_OdemePlani_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ODEMEPLANILISTVIEW
*** Props for the ODEMEPLANILISTVIEW.odemeplani_id field.
DBSetProp('ODEMEPLANILISTVIEW.odemeplani_id', 'Field', 'KeyField', .T.)
DBSetProp('ODEMEPLANILISTVIEW.odemeplani_id', 'Field', 'Updatable', .T.)
DBSetProp('ODEMEPLANILISTVIEW.odemeplani_id', 'Field', 'UpdateName', 'dbo.OdemePlani.OdemePlani_Id')
DBSetProp('ODEMEPLANILISTVIEW.odemeplani_id', 'Field', 'DataType', "C(36)")
DBSetProp('ODEMEPLANILISTVIEW.odemeplani_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ODEMEPLANILISTVIEW.odemeplani_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFECDESCRIPT","Odemeplani Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFECFRMCAPTN","Ödemeplaný ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFECDLGCAPTN","Ödemeplaný ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFECGRDCAPTN","Ödemeplaný ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFECRPTCAPTN","Ödemeplaný ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFEMTOOLTIP","Ödemeplaný ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFEMSTATUSTXT","Ödemeplaný ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ODEMEPLANILISTVIEW.odemeplani_fk field.
DBSetProp('ODEMEPLANILISTVIEW.odemeplani_fk', 'Field', 'KeyField', .F.)
DBSetProp('ODEMEPLANILISTVIEW.odemeplani_fk', 'Field', 'Updatable', .T.)
DBSetProp('ODEMEPLANILISTVIEW.odemeplani_fk', 'Field', 'UpdateName', 'dbo.OdemePlani.OdemePlani_Fk')
DBSetProp('ODEMEPLANILISTVIEW.odemeplani_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ODEMEPLANILISTVIEW.odemeplani_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFECDESCRIPT","Odemeplani Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFECFRMCAPTN","Ödemeplaný FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFECDLGCAPTN","Ödemeplaný FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFECGRDCAPTN","Ödemeplaný FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFECRPTCAPTN","Ödemeplaný FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFEMTOOLTIP","Ödemeplaný FK                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFEMSTATUSTXT","Ödemeplaný FK                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odemeplani_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ODEMEPLANILISTVIEW.borclu_id field.
DBSetProp('ODEMEPLANILISTVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('ODEMEPLANILISTVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('ODEMEPLANILISTVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.OdemePlani.Borclu_Id')
DBSetProp('ODEMEPLANILISTVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ODEMEPLANILISTVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECLUTAG","borclu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_id","FIELD",;
		"VFEMLUUPDFLDS","borclu_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the ODEMEPLANILISTVIEW.borclu_adi field.
DBSetProp('ODEMEPLANILISTVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('ODEMEPLANILISTVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('ODEMEPLANILISTVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.OdemePlani.Borclu_Adi')
DBSetProp('ODEMEPLANILISTVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ODEMEPLANILISTVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ODEMEPLANILISTVIEW.odeme_tarihi field.
DBSetProp('ODEMEPLANILISTVIEW.odeme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('ODEMEPLANILISTVIEW.odeme_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('ODEMEPLANILISTVIEW.odeme_tarihi', 'Field', 'UpdateName', 'dbo.OdemePlani.Odeme_Tarihi')
DBSetProp('ODEMEPLANILISTVIEW.odeme_tarihi', 'Field', 'DataType', "D")
DBSetProp('ODEMEPLANILISTVIEW.odeme_tarihi', 'Field', 'DefaultValue', "Date()")
*** DBCX Field Properties for ODEMEPLANILISTVIEW.odeme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFECDESCRIPT","Odeme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFECFRMCAPTN","Ödeme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFECDLGCAPTN","Ödeme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFECGRDCAPTN","Ödeme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFECRPTCAPTN","Ödeme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFEMTOOLTIP","Ödeme Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ödeme Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_tarihi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ODEMEPLANILISTVIEW.odeme_miktari field.
DBSetProp('ODEMEPLANILISTVIEW.odeme_miktari', 'Field', 'KeyField', .F.)
DBSetProp('ODEMEPLANILISTVIEW.odeme_miktari', 'Field', 'Updatable', .T.)
DBSetProp('ODEMEPLANILISTVIEW.odeme_miktari', 'Field', 'UpdateName', 'dbo.OdemePlani.Odeme_Miktari')
DBSetProp('ODEMEPLANILISTVIEW.odeme_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for ODEMEPLANILISTVIEW.odeme_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFECDESCRIPT","Odeme Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFECFRMCAPTN","Ödeme Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFECDLGCAPTN","Ödeme Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFECGRDCAPTN","Ödeme Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFECRPTCAPTN","Ödeme Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFEMTOOLTIP","Ödeme Miktarý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFEMSTATUSTXT","Ödeme Miktarý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_miktari","FIELD",;
		"VFEMFORMAT","RK") &&Format
ENDIF
 
*** Props for the ODEMEPLANILISTVIEW.odeme_sonucu field.
DBSetProp('ODEMEPLANILISTVIEW.odeme_sonucu', 'Field', 'KeyField', .F.)
DBSetProp('ODEMEPLANILISTVIEW.odeme_sonucu', 'Field', 'Updatable', .T.)
DBSetProp('ODEMEPLANILISTVIEW.odeme_sonucu', 'Field', 'UpdateName', 'dbo.OdemePlani.Odeme_Sonucu')
DBSetProp('ODEMEPLANILISTVIEW.odeme_sonucu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ODEMEPLANILISTVIEW.odeme_sonucu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFECDESCRIPT","Odeme Sonucu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFECFRMCAPTN","Ödeme Sonucu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFECDLGCAPTN","Ödeme Sonucu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFECGRDCAPTN","Ödeme Sonucu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFECRPTCAPTN","Ödeme Sonucu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFEMTOOLTIP","Ödeme Sonucu                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFEMSTATUSTXT","Ödeme Sonucu                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.odeme_sonucu","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ODEMEPLANILISTVIEW.aciklama field.
DBSetProp('ODEMEPLANILISTVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('ODEMEPLANILISTVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('ODEMEPLANILISTVIEW.aciklama', 'Field', 'UpdateName', 'dbo.OdemePlani.Aciklama')
DBSetProp('ODEMEPLANILISTVIEW.aciklama', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for ODEMEPLANILISTVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ODEMEPLANILISTVIEW.aciklama","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
