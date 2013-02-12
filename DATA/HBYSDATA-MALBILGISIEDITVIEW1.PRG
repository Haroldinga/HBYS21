***************** Begin View Definition MALBILGISIEDITVIEW ***************


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



CREATE SQL VIEW "MALBILGISIEDITVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Malbilgisi.MalBilgisi_Id,;
		Malbilgisi.MalBilgisi_Fk,;
		Malbilgisi.Borclu_Id,;
		Malbilgisi.Borclu_Adi,;
		Malbilgisi.Rehber_Id,;
		Malbilgisi.Mal_Tipi,;
		Malbilgisi.Mal_Bilgisi,;
		Malbilgisi.Mal_Tutari,;
		Malbilgisi.Muhatap_Adi,;
		Malbilgisi.Muhatap_Adresi,;
		Malbilgisi.Haciz_Tarihi,;
		Malbilgisi.Maas_Muvafakat_Miktari;
	FROM dbo.MalBilgisi Malbilgisi

DBSetProp('MALBILGISIEDITVIEW', 'View', 'UpdateType', 1)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'WhereType', 3)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'Tables', 'dbo.MalBilgisi')
DBSetProp('MALBILGISIEDITVIEW', 'View', 'Prepared', .F.)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'FetchSize', -1)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'ParameterList', "vp_MalBilgisi_Id,'C'")
DBSetProp('MALBILGISIEDITVIEW', 'View', 'Comment', "")
DBSetProp('MALBILGISIEDITVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MALBILGISIEDITVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MALBILGISIEDITVIEW
	GoExplorer.odbcx.Validate("MALBILGISIEDITVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW","VIEW",;
		"VFECDESCRIPT","MalBilgisiEditView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_MalBilgisi_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Malbilgisi Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFECFRMCAPTN","Malbilgisi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFECDLGCAPTN","Malbilgisi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFEMTOOLTIP","Malbilgisi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFEMSTATUSTXT","Malbilgisi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFEMDEFAULT","99999999-9999-9999-9999-999999999999") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.vp_MalBilgisi_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MALBILGISIEDITVIEW
*** Props for the MALBILGISIEDITVIEW.malbilgisi_id field.
DBSetProp('MALBILGISIEDITVIEW.malbilgisi_id', 'Field', 'KeyField', .T.)
DBSetProp('MALBILGISIEDITVIEW.malbilgisi_id', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.malbilgisi_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Id')
DBSetProp('MALBILGISIEDITVIEW.malbilgisi_id', 'Field', 'DataType', "C(36)")
DBSetProp('MALBILGISIEDITVIEW.malbilgisi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MALBILGISIEDITVIEW.malbilgisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFECDESCRIPT","Malbilgisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFECFRMCAPTN","Malbilgisi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFECDLGCAPTN","Malbilgisi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFECGRDCAPTN","Malbilgisi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFECRPTCAPTN","Malbilgisi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFEMTOOLTIP","Malbilgisi ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFEMSTATUSTXT","Malbilgisi ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.malbilgisi_fk field.
DBSetProp('MALBILGISIEDITVIEW.malbilgisi_fk', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.malbilgisi_fk', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.malbilgisi_fk', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Fk')
DBSetProp('MALBILGISIEDITVIEW.malbilgisi_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISIEDITVIEW.malbilgisi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFECDESCRIPT","Malbilgisi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFECFRMCAPTN","Malbilgisi FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFECDLGCAPTN","Malbilgisi FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFECGRDCAPTN","Malbilgisi FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFECRPTCAPTN","Malbilgisi FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFEMTOOLTIP","Malbilgisi FK                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFEMSTATUSTXT","Malbilgisi FK                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.malbilgisi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.borclu_id field.
DBSetProp('MALBILGISIEDITVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.Borclu_Id')
DBSetProp('MALBILGISIEDITVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISIEDITVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECLUTAG","borclu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_id","FIELD",;
		"VFEMLUUPDFLDS","borclu_adi, rehber_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.borclu_adi field.
DBSetProp('MALBILGISIEDITVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Borclu_Adi')
DBSetProp('MALBILGISIEDITVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISIEDITVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.rehber_id field.
DBSetProp('MALBILGISIEDITVIEW.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.Rehber_Id')
DBSetProp('MALBILGISIEDITVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISIEDITVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.mal_tipi field.
DBSetProp('MALBILGISIEDITVIEW.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.mal_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.mal_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tipi')
DBSetProp('MALBILGISIEDITVIEW.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISIEDITVIEW.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!maltipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECLUTAG","mal_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFEMLUFIELDS","mal_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFEMLUUPDTEXP","Maltipilookupview.mal_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.mal_bilgisi field.
DBSetProp('MALBILGISIEDITVIEW.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.mal_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.mal_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Bilgisi')
DBSetProp('MALBILGISIEDITVIEW.mal_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISIEDITVIEW.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_bilgisi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.mal_tutari field.
DBSetProp('MALBILGISIEDITVIEW.mal_tutari', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.mal_tutari', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.mal_tutari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tutari')
DBSetProp('MALBILGISIEDITVIEW.mal_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MALBILGISIEDITVIEW.mal_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFECDESCRIPT","Mal Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFECFRMCAPTN","Mal Tutarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFECDLGCAPTN","Mal Tutarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFECGRDCAPTN","Mal Tutarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFECRPTCAPTN","Mal Tutarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFEMTOOLTIP","Mal Tutarý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFEMSTATUSTXT","Mal Tutarý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.mal_tutari","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.muhatap_adi field.
DBSetProp('MALBILGISIEDITVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adi')
DBSetProp('MALBILGISIEDITVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISIEDITVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.muhatap_adresi field.
DBSetProp('MALBILGISIEDITVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adresi')
DBSetProp('MALBILGISIEDITVIEW.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISIEDITVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.haciz_tarihi field.
DBSetProp('MALBILGISIEDITVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.haciz_tarihi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Haciz_Tarihi')
DBSetProp('MALBILGISIEDITVIEW.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MALBILGISIEDITVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MALBILGISIEDITVIEW.maas_muvafakat_miktari field.
DBSetProp('MALBILGISIEDITVIEW.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISIEDITVIEW.maas_muvafakat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISIEDITVIEW.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Maas_Muvafakat_Miktari')
DBSetProp('MALBILGISIEDITVIEW.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MALBILGISIEDITVIEW.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Maaþ Muvafakat") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Maaþ Muvafakat") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Maaþ Muvafakat") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Maaþ Muvafakat") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Maaþ Muvafakat                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Maaþ Muvafakat                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",9) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISIEDITVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMFORMAT","KRZ") &&Format
ENDIF
 
