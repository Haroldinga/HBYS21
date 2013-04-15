***************** Begin View Definition MUVEKKILEDITVIEW ***************


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



CREATE SQL VIEW "MUVEKKILEDITVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Muvekkil.Muvekkil_Id,;
		Muvekkil.Muvekkil_Tipi,;
		Muvekkil.IsYeri_Adi,;
		Muvekkil.Departman,;
		Muvekkil.Is_Unvani,;
		Muvekkil.Muvekkil_Adi,;
		Muvekkil.Ticaret_Sicil_No,;
		Muvekkil.Vergi_No,;
		Muvekkil.Vergi_Dairesi,;
		Muvekkil.TcKimlik_No,;
		Muvekkil.Cinsiyeti,;
		Muvekkil.Baba_Adi,;
		Muvekkil.Ana_Adi,;
		Muvekkil.Dogum_Yeri,;
		Muvekkil.Dogum_Tarihi,;
		Muvekkil.Medeni_Hali,;
		Muvekkil.Il_Adi,;
		Muvekkil.Ilce_Adi,;
		Muvekkil.Mahalle,;
		Muvekkil.Koy,;
		Muvekkil.Cilt_No,;
		Muvekkil.Sira_No,;
		Muvekkil.Verildigi_Yer,;
		Muvekkil.Verilis_Nedeni,;
		Muvekkil.Verilis_Tarihi,;
		Muvekkil.Iletisim_Telefonu,;
		Muvekkil.Iletisim_Adresi,;
		Muvekkil.e_Posta,;
		Muvekkil.Web_Sayfasi_Adresi,;
		Muvekkil.Notlar,;
		Muvekkil.Resim_Id,;
		Muvekkil.Resim_Len;
	FROM dbo.Muvekkil Muvekkil

DBSetProp('MUVEKKILEDITVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'WhereType', 3)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'Tables', 'dbo.Muvekkil')
DBSetProp('MUVEKKILEDITVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'FetchSize', -1)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'ParameterList', "vp_Muvekkil_Id,'C'")
DBSetProp('MUVEKKILEDITVIEW', 'View', 'Comment', "")
DBSetProp('MUVEKKILEDITVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUVEKKILEDITVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for MUVEKKILEDITVIEW
	GoExplorer.odbcx.Validate("MUVEKKILEDITVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW","VIEW",;
		"VFECDESCRIPT","Muvekkileditview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECFRMCAPTN","Muvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDLGCAPTN","Muvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMTOOLTIP","Muvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMSTATUSTXT","Muvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MUVEKKILEDITVIEW
*** Props for the MUVEKKILEDITVIEW.muvekkil_id field.
DBSetProp('MUVEKKILEDITVIEW.muvekkil_id', 'Field', 'KeyField', .T.)
DBSetProp('MUVEKKILEDITVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Id')
DBSetProp('MUVEKKILEDITVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
DBSetProp('MUVEKKILEDITVIEW.muvekkil_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Müvekkil ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Müvekkil ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Müvekkil ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Müvekkil ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Müvekkil ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Müvekkil ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.muvekkil_tipi field.
DBSetProp('MUVEKKILEDITVIEW.muvekkil_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.muvekkil_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.muvekkil_tipi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Tipi')
DBSetProp('MUVEKKILEDITVIEW.muvekkil_tipi', 'Field', 'DataType', "C(6)")
DBSetProp('MUVEKKILEDITVIEW.muvekkil_tipi', 'Field', 'DefaultValue', "'Kurum'")
*** DBCX Field Properties for MUVEKKILEDITVIEW.muvekkil_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECDESCRIPT","Muvekkil Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Tipi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Tipi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!muvekkiltipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECLUTAG","muvekkil_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFEMLUFIELDS","muvekkil_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFEMLUUPDTEXP","Muvekkiltipilookupview.muvekkil_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.isyeri_adi field.
DBSetProp('MUVEKKILEDITVIEW.isyeri_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.isyeri_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.isyeri_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.IsYeri_Adi')
DBSetProp('MUVEKKILEDITVIEW.isyeri_adi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.isyeri_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFECDESCRIPT","Isyeri Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFECFRMCAPTN","Ýsyeri Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFECDLGCAPTN","Ýsyeri Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFECGRDCAPTN","Ýsyeri Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFECRPTCAPTN","Ýsyeri Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFEMTOOLTIP","Ýsyeri Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFEMSTATUSTXT","Ýsyeri Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.isyeri_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.departman field.
DBSetProp('MUVEKKILEDITVIEW.departman', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.departman', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.departman', 'Field', 'UpdateName', 'dbo.Muvekkil.Departman')
DBSetProp('MUVEKKILEDITVIEW.departman', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.departman
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFECDESCRIPT","Departman Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFECFRMCAPTN","Departman") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFECDLGCAPTN","Departman") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFECGRDCAPTN","Departman") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFECRPTCAPTN","Departman") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFEMTOOLTIP","Departman") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFEMSTATUSTXT","Departman") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.departman","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.is_unvani field.
DBSetProp('MUVEKKILEDITVIEW.is_unvani', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.is_unvani', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.is_unvani', 'Field', 'UpdateName', 'dbo.Muvekkil.Is_Unvani')
DBSetProp('MUVEKKILEDITVIEW.is_unvani', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.is_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFECDESCRIPT","Is Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFECFRMCAPTN","Ýþ Unvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFECDLGCAPTN","Ýþ Unvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFECGRDCAPTN","Ýþ Unvaný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFECRPTCAPTN","Ýþ Unvaný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFEMTOOLTIP","Ýþ Unvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFEMSTATUSTXT","Ýþ Unvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.is_unvani","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.muvekkil_adi field.
DBSetProp('MUVEKKILEDITVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Adi')
DBSetProp('MUVEKKILEDITVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.ticaret_sicil_no field.
DBSetProp('MUVEKKILEDITVIEW.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.ticaret_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Muvekkil.Ticaret_Sicil_No')
DBSetProp('MUVEKKILEDITVIEW.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Ticaret Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Ticaret Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Ticaret Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Ticaret Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.vergi_no field.
DBSetProp('MUVEKKILEDITVIEW.vergi_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.vergi_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.vergi_no', 'Field', 'UpdateName', 'dbo.Muvekkil.Vergi_No')
DBSetProp('MUVEKKILEDITVIEW.vergi_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.vergi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFECDESCRIPT","Vergi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFECFRMCAPTN","Vergi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFECDLGCAPTN","Vergi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFECGRDCAPTN","Vergi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFECRPTCAPTN","Vergi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFEMTOOLTIP","Vergi No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFEMSTATUSTXT","Vergi No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_no","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.vergi_dairesi field.
DBSetProp('MUVEKKILEDITVIEW.vergi_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.vergi_dairesi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.vergi_dairesi', 'Field', 'UpdateName', 'dbo.Muvekkil.Vergi_Dairesi')
DBSetProp('MUVEKKILEDITVIEW.vergi_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.vergi_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFECDESCRIPT","Vergi Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFECFRMCAPTN","Vergi Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFECDLGCAPTN","Vergi Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFECGRDCAPTN","Vergi Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFECRPTCAPTN","Vergi Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFEMTOOLTIP","Vergi Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFEMSTATUSTXT","Vergi Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.vergi_dairesi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.tckimlik_no field.
DBSetProp('MUVEKKILEDITVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Muvekkil.TcKimlik_No')
DBSetProp('MUVEKKILEDITVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","TC Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","TC Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","TC Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","TC Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","TC Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","TC Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.cinsiyeti field.
DBSetProp('MUVEKKILEDITVIEW.cinsiyeti', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.cinsiyeti', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.cinsiyeti', 'Field', 'UpdateName', 'dbo.Muvekkil.Cinsiyeti')
DBSetProp('MUVEKKILEDITVIEW.cinsiyeti', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.cinsiyeti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECDESCRIPT","Cinsiyeti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECFRMCAPTN","Cinsiyeti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECDLGCAPTN","Cinsiyeti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECGRDCAPTN","Cinsiyeti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECRPTCAPTN","Cinsiyeti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFEMTOOLTIP","Cinsiyeti") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFEMSTATUSTXT","Cinsiyeti") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECLUTABLE","hbysdata!cinsiyetlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECLUTAG","cinsiyeti") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFEMLUFIELDS","cinsiyeti") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFEMLUUPDTEXP","Cinsiyetlookupview.cinsiyeti") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cinsiyeti","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.baba_adi field.
DBSetProp('MUVEKKILEDITVIEW.baba_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.baba_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.baba_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Baba_Adi')
DBSetProp('MUVEKKILEDITVIEW.baba_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.baba_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFECDESCRIPT","Baba Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFECFRMCAPTN","Baba Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFECDLGCAPTN","Baba Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFECGRDCAPTN","Baba Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFECRPTCAPTN","Baba Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFEMTOOLTIP","Baba Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFEMSTATUSTXT","Baba Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.baba_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.ana_adi field.
DBSetProp('MUVEKKILEDITVIEW.ana_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.ana_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.ana_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Ana_Adi')
DBSetProp('MUVEKKILEDITVIEW.ana_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.ana_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFECDESCRIPT","Ana Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFECFRMCAPTN","Ana Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFECDLGCAPTN","Ana Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFECGRDCAPTN","Ana Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFECRPTCAPTN","Ana Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFEMTOOLTIP","Ana Adý                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFEMSTATUSTXT","Ana Adý                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ana_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.dogum_yeri field.
DBSetProp('MUVEKKILEDITVIEW.dogum_yeri', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.dogum_yeri', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.dogum_yeri', 'Field', 'UpdateName', 'dbo.Muvekkil.Dogum_Yeri')
DBSetProp('MUVEKKILEDITVIEW.dogum_yeri', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.dogum_yeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFECDESCRIPT","Dogum Yeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFECFRMCAPTN","Doðum Yeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFECDLGCAPTN","Doðum Yeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFECGRDCAPTN","Doðum Yeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFECRPTCAPTN","Doðum Yeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFEMTOOLTIP","Doðum Yeri                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFEMSTATUSTXT","Doðum Yeri                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_yeri","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.dogum_tarihi field.
DBSetProp('MUVEKKILEDITVIEW.dogum_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.dogum_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.dogum_tarihi', 'Field', 'UpdateName', 'dbo.Muvekkil.Dogum_Tarihi')
DBSetProp('MUVEKKILEDITVIEW.dogum_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUVEKKILEDITVIEW.dogum_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFECDESCRIPT","Dogum Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFECFRMCAPTN","Doðum Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFECDLGCAPTN","Doðum Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFECGRDCAPTN","Doðum Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFECRPTCAPTN","Doðum Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFEMTOOLTIP","Doðum Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFEMSTATUSTXT","Doðum Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.dogum_tarihi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.medeni_hali field.
DBSetProp('MUVEKKILEDITVIEW.medeni_hali', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.medeni_hali', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.medeni_hali', 'Field', 'UpdateName', 'dbo.Muvekkil.Medeni_Hali')
DBSetProp('MUVEKKILEDITVIEW.medeni_hali', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.medeni_hali
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECDESCRIPT","Medeni Hali Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECFRMCAPTN","Medeni Hali") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECDLGCAPTN","Medeni Hali") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECGRDCAPTN","Medeni Hali") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECRPTCAPTN","Medeni Hali") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFEMTOOLTIP","Medeni Hali") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFEMSTATUSTXT","Medeni Hali") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECLUTABLE","hbysdata!medenihallookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECLUTAG","medeni_hali") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFEMLUFIELDS","medeni_hali") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFEMLUUPDTEXP","Medenihallookupview.medeni_hali") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.medeni_hali","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.il_adi field.
DBSetProp('MUVEKKILEDITVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.il_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Il_Adi')
DBSetProp('MUVEKKILEDITVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECCLASS","ail_adifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.il_adi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.ilce_adi field.
DBSetProp('MUVEKKILEDITVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Ilce_Adi')
DBSetProp('MUVEKKILEDITVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECCLASS","ailce_adifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.mahalle field.
DBSetProp('MUVEKKILEDITVIEW.mahalle', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.mahalle', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.mahalle', 'Field', 'UpdateName', 'dbo.Muvekkil.Mahalle')
DBSetProp('MUVEKKILEDITVIEW.mahalle', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.mahalle
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFECDESCRIPT","Mahalle Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFECFRMCAPTN","Mahalle") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFECDLGCAPTN","Mahalle") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFECGRDCAPTN","Mahalle") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFECRPTCAPTN","Mahalle") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFEMTOOLTIP","Mahalle") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFEMSTATUSTXT","Mahalle") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.mahalle","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.koy field.
DBSetProp('MUVEKKILEDITVIEW.koy', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.koy', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.koy', 'Field', 'UpdateName', 'dbo.Muvekkil.Koy')
DBSetProp('MUVEKKILEDITVIEW.koy', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.koy
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFECDESCRIPT","Koy Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFECFRMCAPTN","Köy") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFECDLGCAPTN","Köy") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFECGRDCAPTN","Köy") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFECRPTCAPTN","Köy") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFEMTOOLTIP","Köy                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFEMSTATUSTXT","Köy                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.koy","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.cilt_no field.
DBSetProp('MUVEKKILEDITVIEW.cilt_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.cilt_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.cilt_no', 'Field', 'UpdateName', 'dbo.Muvekkil.Cilt_No')
DBSetProp('MUVEKKILEDITVIEW.cilt_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.cilt_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFECDESCRIPT","Cilt No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFECFRMCAPTN","Cilt No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFECDLGCAPTN","Cilt No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFECGRDCAPTN","Cilt No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFECRPTCAPTN","Cilt No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFEMTOOLTIP","Cilt No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFEMSTATUSTXT","Cilt No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.cilt_no","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.sira_no field.
DBSetProp('MUVEKKILEDITVIEW.sira_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.sira_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.sira_no', 'Field', 'UpdateName', 'dbo.Muvekkil.Sira_No')
DBSetProp('MUVEKKILEDITVIEW.sira_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.sira_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFECDESCRIPT","Sira No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFECFRMCAPTN","Sýra No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFECDLGCAPTN","Sýra No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFECGRDCAPTN","Sýra No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFECRPTCAPTN","Sýra No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFEMTOOLTIP","Sýra No                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFEMSTATUSTXT","Sýra No                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.sira_no","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the MUVEKKILEDITVIEW.verildigi_yer field.
DBSetProp('MUVEKKILEDITVIEW.verildigi_yer', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.verildigi_yer', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.verildigi_yer', 'Field', 'UpdateName', 'dbo.Muvekkil.Verildigi_Yer')
DBSetProp('MUVEKKILEDITVIEW.verildigi_yer', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.verildigi_yer
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFECDESCRIPT","Verildigi Yer Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFECFRMCAPTN","Verildiði Yer") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFECDLGCAPTN","Verildiði Yer") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFECGRDCAPTN","Verildiði Yer") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFECRPTCAPTN","Verildiði Yer") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFEMTOOLTIP","Verildiði Yer                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFEMSTATUSTXT","Verildiði Yer                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verildigi_yer","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.verilis_nedeni field.
DBSetProp('MUVEKKILEDITVIEW.verilis_nedeni', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.verilis_nedeni', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.verilis_nedeni', 'Field', 'UpdateName', 'dbo.Muvekkil.Verilis_Nedeni')
DBSetProp('MUVEKKILEDITVIEW.verilis_nedeni', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.verilis_nedeni
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFECDESCRIPT","Verilis Nedeni Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFECFRMCAPTN","Veriliþ Nedeni") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFECDLGCAPTN","Veriliþ Nedeni") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFECGRDCAPTN","Veriliþ Nedeni") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFECRPTCAPTN","Veriliþ Nedeni") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFEMTOOLTIP","Veriliþ Nedeni                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFEMSTATUSTXT","Veriliþ Nedeni                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_nedeni","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.verilis_tarihi field.
DBSetProp('MUVEKKILEDITVIEW.verilis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.verilis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.verilis_tarihi', 'Field', 'UpdateName', 'dbo.Muvekkil.Verilis_Tarihi')
DBSetProp('MUVEKKILEDITVIEW.verilis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUVEKKILEDITVIEW.verilis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFECDESCRIPT","Verilis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFECFRMCAPTN","Veriliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFECDLGCAPTN","Veriliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFECGRDCAPTN","Veriliþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFECRPTCAPTN","Veriliþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFEMTOOLTIP","Veriliþ Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Veriliþ Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.verilis_tarihi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.iletisim_telefonu field.
DBSetProp('MUVEKKILEDITVIEW.iletisim_telefonu', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.iletisim_telefonu', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.iletisim_telefonu', 'Field', 'UpdateName', 'dbo.Muvekkil.Iletisim_Telefonu')
DBSetProp('MUVEKKILEDITVIEW.iletisim_telefonu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.iletisim_telefonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFECDESCRIPT","Iletisim Telefonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFECFRMCAPTN","Iletisim Telefonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFECDLGCAPTN","Iletisim Telefonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFECGRDCAPTN","Iletisim Telefonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFECRPTCAPTN","Iletisim Telefonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFEMTOOLTIP","Iletisim Telefonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFEMSTATUSTXT","Iletisim Telefonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_telefonu","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.iletisim_adresi field.
DBSetProp('MUVEKKILEDITVIEW.iletisim_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.iletisim_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.iletisim_adresi', 'Field', 'UpdateName', 'dbo.Muvekkil.Iletisim_Adresi')
DBSetProp('MUVEKKILEDITVIEW.iletisim_adresi', 'Field', 'DataType', "C(200)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.iletisim_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFECDESCRIPT","Iletisim Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFECFRMCAPTN","Iletisim Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFECDLGCAPTN","Iletisim Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFECGRDCAPTN","Iletisim Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFECRPTCAPTN","Iletisim Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFEMTOOLTIP","Iletisim Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFEMSTATUSTXT","Iletisim Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.iletisim_adresi","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.e_posta field.
DBSetProp('MUVEKKILEDITVIEW.e_posta', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.e_posta', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.e_posta', 'Field', 'UpdateName', 'dbo.Muvekkil.e_Posta')
DBSetProp('MUVEKKILEDITVIEW.e_posta', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.e_posta
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFECDESCRIPT","E Posta Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFECFRMCAPTN","E-Posta") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFECDLGCAPTN","E-Posta") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFECGRDCAPTN","E-Posta") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFECRPTCAPTN","E-Posta") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFEMTOOLTIP","E-Posta                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFEMSTATUSTXT","E-Posta                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.e_posta","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.web_sayfasi_adresi field.
DBSetProp('MUVEKKILEDITVIEW.web_sayfasi_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.web_sayfasi_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.web_sayfasi_adresi', 'Field', 'UpdateName', 'dbo.Muvekkil.Web_Sayfasi_Adresi')
DBSetProp('MUVEKKILEDITVIEW.web_sayfasi_adresi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.web_sayfasi_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFECDESCRIPT","Web Sayfasi Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFECFRMCAPTN","Web Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFECDLGCAPTN","Web Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFECGRDCAPTN","Web Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFECRPTCAPTN","Web Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFEMTOOLTIP","Web Adresi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFEMSTATUSTXT","Web Adresi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.web_sayfasi_adresi","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.notlar field.
DBSetProp('MUVEKKILEDITVIEW.notlar', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.notlar', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.notlar', 'Field', 'UpdateName', 'dbo.Muvekkil.Notlar')
DBSetProp('MUVEKKILEDITVIEW.notlar', 'Field', 'DataType', "M")
*** DBCX Field Properties for MUVEKKILEDITVIEW.notlar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFECDESCRIPT","Notlar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFECFRMCAPTN","Notlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFECDLGCAPTN","Notlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFECGRDCAPTN","Notlar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFECRPTCAPTN","Notlar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFEMTOOLTIP","Notlar") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFEMSTATUSTXT","Notlar") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.notlar","FIELD",;
		"VFENDISPORDER",74) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.resim_id field.
DBSetProp('MUVEKKILEDITVIEW.resim_id', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.resim_id', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.resim_id', 'Field', 'UpdateName', 'dbo.Muvekkil.Resim_Id')
DBSetProp('MUVEKKILEDITVIEW.resim_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUVEKKILEDITVIEW.resim_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFECDESCRIPT","Resim Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFECFRMCAPTN","Resim") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFECDLGCAPTN","Resim") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFECGRDCAPTN","Resim") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFECRPTCAPTN","Resim") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFEMTOOLTIP","Resim                                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFEMSTATUSTXT","Resim                                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_id","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the MUVEKKILEDITVIEW.resim_len field.
DBSetProp('MUVEKKILEDITVIEW.resim_len', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILEDITVIEW.resim_len', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILEDITVIEW.resim_len', 'Field', 'UpdateName', 'dbo.Muvekkil.Resim_Len')
DBSetProp('MUVEKKILEDITVIEW.resim_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for MUVEKKILEDITVIEW.resim_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFECDESCRIPT","Resim Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFECFRMCAPTN","Resim Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFECDLGCAPTN","Resim Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFECGRDCAPTN","Resim Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFECRPTCAPTN","Resim Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFEMTOOLTIP","Resim Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFEMSTATUSTXT","Resim Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILEDITVIEW.resim_len","FIELD",;
		"VFENDISPORDER",32) &&Display Order
ENDIF
 
