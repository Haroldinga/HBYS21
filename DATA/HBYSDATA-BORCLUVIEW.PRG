***************** Begin View Definition BORCLUVIEW ***************


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



CREATE SQL VIEW "BORCLUVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Borclu.Borclu_Id,;
		Borclu.Borclu_Fk,;
		Borclu.Rehber_Id,;
		Borclu.Borclu_Adi,;
		Borclu.Servis_No,;
		Borclu.Urun_No,;
		Borclu.Musteri_No,;
		Borclu.TcKimlik_No,;
		Borclu.Ticaret_Sicil_No,;
		Borclu.IcraMudurlugu_Id,;
		Borclu.IcraMudurlugu_Adi;
	FROM dbo.Borclu Borclu

DBSetProp('BORCLUVIEW', 'View', 'UpdateType', 1)
DBSetProp('BORCLUVIEW', 'View', 'WhereType', 1)
DBSetProp('BORCLUVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('BORCLUVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('BORCLUVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('BORCLUVIEW', 'View', 'MaxRecords', -1)
DBSetProp('BORCLUVIEW', 'View', 'Tables', 'dbo.Borclu')
DBSetProp('BORCLUVIEW', 'View', 'Prepared', .F.)
DBSetProp('BORCLUVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('BORCLUVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BORCLUVIEW', 'View', 'FetchSize', -1)
DBSetProp('BORCLUVIEW', 'View', 'ParameterList', "vp_Borclu_Fk,'C'")
DBSetProp('BORCLUVIEW', 'View', 'Comment', "")
DBSetProp('BORCLUVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('BORCLUVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for BORCLUVIEW
	GoExplorer.odbcx.Validate("BORCLUVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW","VIEW",;
		"VFECDESCRIPT","Borcluview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Borclu_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Borclu Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECFRMCAPTN","Borçlu FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECDLGCAPTN","Borçlu FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMTOOLTIP","Borçlu FK                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Borçlu FK                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMCOMPARETO","Borclu_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.vp_Borclu_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for BORCLUVIEW
*** Props for the BORCLUVIEW.borclu_id field.
DBSetProp('BORCLUVIEW.borclu_id', 'Field', 'KeyField', .T.)
DBSetProp('BORCLUVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Id')
DBSetProp('BORCLUVIEW.borclu_id', 'Field', 'DataType', "C(36)")
DBSetProp('BORCLUVIEW.borclu_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for BORCLUVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.borclu_fk field.
DBSetProp('BORCLUVIEW.borclu_fk', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.borclu_fk', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.borclu_fk', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Fk')
DBSetProp('BORCLUVIEW.borclu_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BORCLUVIEW.borclu_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFECDESCRIPT","Borclu Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFECFRMCAPTN","Borçlu FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFECDLGCAPTN","Borçlu FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFECGRDCAPTN","Borçlu FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFECRPTCAPTN","Borçlu FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFEMTOOLTIP","Borçlu FK                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFEMSTATUSTXT","Borçlu FK                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.rehber_id field.
DBSetProp('BORCLUVIEW.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Borclu.Rehber_Id')
DBSetProp('BORCLUVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BORCLUVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.borclu_adi field.
DBSetProp('BORCLUVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('BORCLUVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for BORCLUVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.servis_no field.
DBSetProp('BORCLUVIEW.servis_no', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.servis_no', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.servis_no', 'Field', 'UpdateName', 'dbo.Borclu.Servis_No')
DBSetProp('BORCLUVIEW.servis_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BORCLUVIEW.servis_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFECDESCRIPT","Servis No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFECFRMCAPTN","Servis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFECDLGCAPTN","Servis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFECGRDCAPTN","Servis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFECRPTCAPTN","Servis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFEMTOOLTIP","Servis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFEMSTATUSTXT","Servis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.servis_no","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.urun_no field.
DBSetProp('BORCLUVIEW.urun_no', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.urun_no', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.urun_no', 'Field', 'UpdateName', 'dbo.Borclu.Urun_No')
DBSetProp('BORCLUVIEW.urun_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BORCLUVIEW.urun_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFECDESCRIPT","Urun No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFECFRMCAPTN","Ürün No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFECDLGCAPTN","Ürün No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFECGRDCAPTN","Ürün No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFECRPTCAPTN","Ürün No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFEMTOOLTIP","Ürün No                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFEMSTATUSTXT","Ürün No                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.urun_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.musteri_no field.
DBSetProp('BORCLUVIEW.musteri_no', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.musteri_no', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.musteri_no', 'Field', 'UpdateName', 'dbo.Borclu.Musteri_No')
DBSetProp('BORCLUVIEW.musteri_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BORCLUVIEW.musteri_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFECDESCRIPT","Musteri No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFECFRMCAPTN","Müþteri No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFECDLGCAPTN","Müþteri No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFECGRDCAPTN","Müþteri No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFECRPTCAPTN","Müþteri No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFEMTOOLTIP","Müþteri No                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFEMSTATUSTXT","Müþteri No                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.musteri_no","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.tckimlik_no field.
DBSetProp('BORCLUVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('BORCLUVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BORCLUVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","TC Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","TC Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","TC Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","TC Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","TC Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","TC Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.ticaret_sicil_no field.
DBSetProp('BORCLUVIEW.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.ticaret_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Borclu.Ticaret_Sicil_No')
DBSetProp('BORCLUVIEW.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for BORCLUVIEW.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Tic. Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Tic. Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Tic. Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Tic. Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Tic. Sicil No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Tic. Sicil No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.icramudurlugu_id field.
DBSetProp('BORCLUVIEW.icramudurlugu_id', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.icramudurlugu_id', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.icramudurlugu_id', 'Field', 'UpdateName', 'dbo.Borclu.IcraMudurlugu_Id')
DBSetProp('BORCLUVIEW.icramudurlugu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for BORCLUVIEW.icramudurlugu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFECFRMCAPTN","Icramudurlugu Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFECDLGCAPTN","Icramudurlugu Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFECGRDCAPTN","Icramudurlugu Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFECRPTCAPTN","Icramudurlugu Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFEMTOOLTIP","Icramudurlugu Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFEMSTATUSTXT","Icramudurlugu Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the BORCLUVIEW.icramudurlugu_adi field.
DBSetProp('BORCLUVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('BORCLUVIEW.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('BORCLUVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.Borclu.IcraMudurlugu_Adi')
DBSetProp('BORCLUVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for BORCLUVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Talimat Ýcra Mdr.") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Talimat Ýcra Mdr.") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Talimat Ýcra Mdr.") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Talimat Ýcra Mdr.") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Talimat Ýcra Mdr.                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Talimat Ýcra Mdr.                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!BORCLUVIEW.icramudurlugu_adi","FIELD",;
		"VFEMLUUPDFLDS","icramudurlugu_id") &&After Lookup Update Field List
ENDIF
 
