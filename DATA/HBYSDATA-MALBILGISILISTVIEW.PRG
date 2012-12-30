***************** Begin View Definition MALBILGISILISTVIEW ***************


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



CREATE SQL VIEW "MALBILGISILISTVIEW" ; 
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

DBSetProp('MALBILGISILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('MALBILGISILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('MALBILGISILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MALBILGISILISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MALBILGISILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MALBILGISILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MALBILGISILISTVIEW', 'View', 'Tables', 'dbo.MalBilgisi')
DBSetProp('MALBILGISILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('MALBILGISILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MALBILGISILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MALBILGISILISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('MALBILGISILISTVIEW', 'View', 'ParameterList', "vp_MalBilgisi_Fk,'C'")
DBSetProp('MALBILGISILISTVIEW', 'View', 'Comment', "")
DBSetProp('MALBILGISILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MALBILGISILISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MALBILGISILISTVIEW
	GoExplorer.odbcx.Validate("MALBILGISILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW","VIEW",;
		"VFECDESCRIPT","Malbilgisilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_MalBilgisi_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Malbilgisi Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECFRMCAPTN","Malbilgisi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECDLGCAPTN","Malbilgisi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMTOOLTIP","Malbilgisi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Malbilgisi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECCLASS","idynamicviewparameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.vp_MalBilgisi_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MALBILGISILISTVIEW
*** Props for the MALBILGISILISTVIEW.malbilgisi_id field.
DBSetProp('MALBILGISILISTVIEW.malbilgisi_id', 'Field', 'KeyField', .T.)
DBSetProp('MALBILGISILISTVIEW.malbilgisi_id', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.malbilgisi_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Id')
DBSetProp('MALBILGISILISTVIEW.malbilgisi_id', 'Field', 'DataType', "C(36)")
DBSetProp('MALBILGISILISTVIEW.malbilgisi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MALBILGISILISTVIEW.malbilgisi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFECDESCRIPT","Malbilgisi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFECFRMCAPTN","Malbilgisi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFECDLGCAPTN","Malbilgisi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFECGRDCAPTN","Malbilgisi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFECRPTCAPTN","Malbilgisi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFEMTOOLTIP","Malbilgisi ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFEMSTATUSTXT","Malbilgisi ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MALBILGISILISTVIEW.malbilgisi_fk field.
DBSetProp('MALBILGISILISTVIEW.malbilgisi_fk', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.malbilgisi_fk', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.malbilgisi_fk', 'Field', 'UpdateName', 'dbo.MalBilgisi.MalBilgisi_Fk')
DBSetProp('MALBILGISILISTVIEW.malbilgisi_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISILISTVIEW.malbilgisi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFECDESCRIPT","Malbilgisi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFECFRMCAPTN","Malbilgisi FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFECDLGCAPTN","Malbilgisi FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFECGRDCAPTN","Malbilgisi FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFECRPTCAPTN","Malbilgisi FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFEMTOOLTIP","Malbilgisi FK                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFEMSTATUSTXT","Malbilgisi FK                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.malbilgisi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MALBILGISILISTVIEW.borclu_id field.
DBSetProp('MALBILGISILISTVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.Borclu_Id')
DBSetProp('MALBILGISILISTVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISILISTVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECLUTAG","borclu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_id","FIELD",;
		"VFEMLUUPDFLDS","borclu_adi, rehber_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the MALBILGISILISTVIEW.borclu_adi field.
DBSetProp('MALBILGISILISTVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Borclu_Adi')
DBSetProp('MALBILGISILISTVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISILISTVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MALBILGISILISTVIEW.rehber_id field.
DBSetProp('MALBILGISILISTVIEW.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.MalBilgisi.Rehber_Id')
DBSetProp('MALBILGISILISTVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MALBILGISILISTVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MALBILGISILISTVIEW.mal_tipi field.
DBSetProp('MALBILGISILISTVIEW.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.mal_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.mal_tipi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tipi')
DBSetProp('MALBILGISILISTVIEW.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MALBILGISILISTVIEW.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!maltipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECLUTAG","mal_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFEMLUFIELDS","mal_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFEMLUUPDTEXP","Maltipilookupview.mal_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MALBILGISILISTVIEW.mal_bilgisi field.
DBSetProp('MALBILGISILISTVIEW.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.mal_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.mal_bilgisi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Bilgisi')
DBSetProp('MALBILGISILISTVIEW.mal_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISILISTVIEW.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_bilgisi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MALBILGISILISTVIEW.mal_tutari field.
DBSetProp('MALBILGISILISTVIEW.mal_tutari', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.mal_tutari', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.mal_tutari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Mal_Tutari')
DBSetProp('MALBILGISILISTVIEW.mal_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MALBILGISILISTVIEW.mal_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFECDESCRIPT","Mal Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFECFRMCAPTN","Mal Tutarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFECDLGCAPTN","Mal Tutarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFECGRDCAPTN","Mal Tutarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFECRPTCAPTN","Mal Tutarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFEMTOOLTIP","Mal Tutarý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFEMSTATUSTXT","Mal Tutarý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.mal_tutari","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the MALBILGISILISTVIEW.muhatap_adi field.
DBSetProp('MALBILGISILISTVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adi')
DBSetProp('MALBILGISILISTVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MALBILGISILISTVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MALBILGISILISTVIEW.muhatap_adresi field.
DBSetProp('MALBILGISILISTVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Muhatap_Adresi')
DBSetProp('MALBILGISILISTVIEW.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MALBILGISILISTVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MALBILGISILISTVIEW.haciz_tarihi field.
DBSetProp('MALBILGISILISTVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.haciz_tarihi', 'Field', 'UpdateName', 'dbo.MalBilgisi.Haciz_Tarihi')
DBSetProp('MALBILGISILISTVIEW.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MALBILGISILISTVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MALBILGISILISTVIEW.maas_muvafakat_miktari field.
DBSetProp('MALBILGISILISTVIEW.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MALBILGISILISTVIEW.maas_muvafakat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MALBILGISILISTVIEW.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.MalBilgisi.Maas_Muvafakat_Miktari')
DBSetProp('MALBILGISILISTVIEW.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MALBILGISILISTVIEW.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Maaþ Muvafakat") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Maaþ Muvafakat") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Maaþ Muvafakat") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Maaþ Muvafakat") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Maaþ Muvafakat                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Maaþ Muvafakat                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",9) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MALBILGISILISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMFORMAT","KRZ") &&Format
ENDIF
 
