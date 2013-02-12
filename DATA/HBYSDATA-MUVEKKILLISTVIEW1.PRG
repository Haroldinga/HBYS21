***************** Begin View Definition MUVEKKILLISTVIEW ***************


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



CREATE SQL VIEW "MUVEKKILLISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Muvekkil.Muvekkil_Id,;
		Muvekkil.Muvekkil_Tipi,;
		Muvekkil.Muvekkil_Adi,;
		Muvekkil.Vergi_No,;
		Muvekkil.Vergi_Dairesi,;
		Muvekkil.Ticaret_Sicil_No,;
		Muvekkil.TcKimlik_No,;
		Muvekkil.Baba_Adi,;
		Muvekkil.Ana_Adi,;
		Muvekkil.Dogum_Yeri;
	FROM dbo.Muvekkil Muvekkil

DBSetProp('MUVEKKILLISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'WhereType', 3)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'Tables', 'dbo.Muvekkil')
DBSetProp('MUVEKKILLISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'ParameterList', "vp_Muvekkil_Adi,'C'")
DBSetProp('MUVEKKILLISTVIEW', 'View', 'Comment', "")
DBSetProp('MUVEKKILLISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUVEKKILLISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MUVEKKILLISTVIEW
	GoExplorer.odbcx.Validate("MUVEKKILLISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW","VIEW",;
		"VFECDESCRIPT","Muvekkillistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MUVEKKILLISTVIEW
*** Props for the MUVEKKILLISTVIEW.muvekkil_id field.
DBSetProp('MUVEKKILLISTVIEW.muvekkil_id', 'Field', 'KeyField', .T.)
DBSetProp('MUVEKKILLISTVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Id')
DBSetProp('MUVEKKILLISTVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
DBSetProp('MUVEKKILLISTVIEW.muvekkil_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MUVEKKILLISTVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Müvekkil ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Müvekkil ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Müvekkil ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Müvekkil ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Müvekkil ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Müvekkil ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLISTVIEW.muvekkil_tipi field.
DBSetProp('MUVEKKILLISTVIEW.muvekkil_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLISTVIEW.muvekkil_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.muvekkil_tipi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Tipi')
DBSetProp('MUVEKKILLISTVIEW.muvekkil_tipi', 'Field', 'DataType', "C(6)")
DBSetProp('MUVEKKILLISTVIEW.muvekkil_tipi', 'Field', 'DefaultValue', "'Kurum'")
*** DBCX Field Properties for MUVEKKILLISTVIEW.muvekkil_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECDESCRIPT","Muvekkil Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Tipi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Tipi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!muvekkiltipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECLUTAG","muvekkil_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFEMLUFIELDS","muvekkil_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFEMLUUPDTEXP","Muvekkiltipilookupview.muvekkil_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLISTVIEW.muvekkil_adi field.
DBSetProp('MUVEKKILLISTVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLISTVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Adi')
DBSetProp('MUVEKKILLISTVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUVEKKILLISTVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLISTVIEW.vergi_no field.
DBSetProp('MUVEKKILLISTVIEW.vergi_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLISTVIEW.vergi_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.vergi_no', 'Field', 'UpdateName', 'dbo.Muvekkil.Vergi_No')
DBSetProp('MUVEKKILLISTVIEW.vergi_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILLISTVIEW.vergi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFECDESCRIPT","Vergi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFECFRMCAPTN","Vergi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFECDLGCAPTN","Vergi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFECGRDCAPTN","Vergi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFECRPTCAPTN","Vergi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFEMTOOLTIP","Vergi No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFEMSTATUSTXT","Vergi No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_no","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLISTVIEW.vergi_dairesi field.
DBSetProp('MUVEKKILLISTVIEW.vergi_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLISTVIEW.vergi_dairesi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.vergi_dairesi', 'Field', 'UpdateName', 'dbo.Muvekkil.Vergi_Dairesi')
DBSetProp('MUVEKKILLISTVIEW.vergi_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILLISTVIEW.vergi_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFECDESCRIPT","Vergi Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFECFRMCAPTN","Vergi Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFECDLGCAPTN","Vergi Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFECGRDCAPTN","Vergi Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFECRPTCAPTN","Vergi Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFEMTOOLTIP","Vergi Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFEMSTATUSTXT","Vergi Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.vergi_dairesi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLISTVIEW.ticaret_sicil_no field.
DBSetProp('MUVEKKILLISTVIEW.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLISTVIEW.ticaret_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Muvekkil.Ticaret_Sicil_No')
DBSetProp('MUVEKKILLISTVIEW.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILLISTVIEW.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Ticaret Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Ticaret Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Ticaret Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Ticaret Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLISTVIEW.tckimlik_no field.
DBSetProp('MUVEKKILLISTVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLISTVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Muvekkil.TcKimlik_No')
DBSetProp('MUVEKKILLISTVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILLISTVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","TC Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","TC Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","TC Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","TC Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","TC Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","TC Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLISTVIEW.baba_adi field.
DBSetProp('MUVEKKILLISTVIEW.baba_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLISTVIEW.baba_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.baba_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Baba_Adi')
DBSetProp('MUVEKKILLISTVIEW.baba_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILLISTVIEW.baba_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFECDESCRIPT","Baba Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFECFRMCAPTN","Baba Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFECDLGCAPTN","Baba Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFECGRDCAPTN","Baba Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFECRPTCAPTN","Baba Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFEMTOOLTIP","Baba Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFEMSTATUSTXT","Baba Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.baba_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLISTVIEW.ana_adi field.
DBSetProp('MUVEKKILLISTVIEW.ana_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLISTVIEW.ana_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.ana_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Ana_Adi')
DBSetProp('MUVEKKILLISTVIEW.ana_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILLISTVIEW.ana_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFECDESCRIPT","Ana Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFECFRMCAPTN","Ana Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFECDLGCAPTN","Ana Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFECGRDCAPTN","Ana Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFECRPTCAPTN","Ana Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFEMTOOLTIP","Ana Adý                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFEMSTATUSTXT","Ana Adý                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.ana_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLISTVIEW.dogum_yeri field.
DBSetProp('MUVEKKILLISTVIEW.dogum_yeri', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLISTVIEW.dogum_yeri', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLISTVIEW.dogum_yeri', 'Field', 'UpdateName', 'dbo.Muvekkil.Dogum_Yeri')
DBSetProp('MUVEKKILLISTVIEW.dogum_yeri', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILLISTVIEW.dogum_yeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFECDESCRIPT","Dogum Yeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFECFRMCAPTN","Doðum Yeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFECDLGCAPTN","Doðum Yeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFECGRDCAPTN","Doðum Yeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFECRPTCAPTN","Doðum Yeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFEMTOOLTIP","Doðum Yeri                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFEMSTATUSTXT","Doðum Yeri                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLISTVIEW.dogum_yeri","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
