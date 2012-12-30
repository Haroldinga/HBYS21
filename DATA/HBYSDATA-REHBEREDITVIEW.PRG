***************** Begin View Definition REHBEREDITVIEW ***************


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



CREATE SQL VIEW "REHBEREDITVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Rehber.Rehber_Id,;
		Rehber.Rehber_Tipi,;
		Rehber.TcKimlik_No,;
		Rehber.Ticaret_Sicil_No,;
		Rehber.Adi,;
		Rehber.Isyeri_Adi,;
		Rehber.Departman,;
		Rehber.Is_Unvani,;
		Rehber.Vergi_No,;
		Rehber.Vergi_Dairesi,;
		Rehber.SSK_Sicil_No,;
		Rehber.SSK_Isyeri_No,;
		Rehber.Kimlik_No,;
		Rehber.Cinsiyeti,;
		Rehber.Baba_Adi,;
		Rehber.Ana_Adi,;
		Rehber.Dogum_Yeri,;
		Rehber.Dogum_Tarihi,;
		Rehber.Medeni_Hali,;
		Rehber.Il_Adi,;
		Rehber.Ilce_Adi,;
		Rehber.Mahalle,;
		Rehber.Koy,;
		Rehber.Cilt_No,;
		Rehber.Sira_No,;
		Rehber.Verildigi_Yer,;
		Rehber.Verilis_Nedeni,;
		Rehber.Verilis_Tarihi,;
		Rehber.Iletisim_Telefonu,;
		Rehber.Telefon_Statusu,;
		Rehber.Iletisim_Adresi,;
		Rehber.Adres_Statusu,;
		Rehber.e_Posta,;
		Rehber.Web_Adresi,;
		Rehber.Resim_Id,;
		Rehber.Resim_Len,;
		Rehber.Notlar;
	FROM dbo.Rehber Rehber

DBSetProp('REHBEREDITVIEW', 'View', 'UpdateType', 1)
DBSetProp('REHBEREDITVIEW', 'View', 'WhereType', 3)
DBSetProp('REHBEREDITVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('REHBEREDITVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('REHBEREDITVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('REHBEREDITVIEW', 'View', 'MaxRecords', -1)
DBSetProp('REHBEREDITVIEW', 'View', 'Tables', 'dbo.Rehber')
DBSetProp('REHBEREDITVIEW', 'View', 'Prepared', .F.)
DBSetProp('REHBEREDITVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('REHBEREDITVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('REHBEREDITVIEW', 'View', 'FetchSize', -1)
DBSetProp('REHBEREDITVIEW', 'View', 'ParameterList', "vp_Rehber_Id,'C';vp_TcKimlik_No,'C';vp_Ticaret_Sicil_No,'C'")
DBSetProp('REHBEREDITVIEW', 'View', 'Comment', "")
DBSetProp('REHBEREDITVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('REHBEREDITVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for REHBEREDITVIEW
	GoExplorer.odbcx.Validate("REHBEREDITVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW","VIEW",;
		"VFECDESCRIPT","Rehbereditview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Rehber_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Rehber Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_TcKimlik_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECDESCRIPT","Vp Tckimlik No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMCOMPARETO","TcKimlik_No") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_TcKimlik_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Ticaret_Sicil_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECDESCRIPT","Vp Ticaret Sicil No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMTOOLTIP","Ticaret Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMSTATUSTXT","Ticaret Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vp_Ticaret_Sicil_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for REHBEREDITVIEW
*** Props for the REHBEREDITVIEW.rehber_id field.
DBSetProp('REHBEREDITVIEW.rehber_id', 'Field', 'KeyField', .T.)
DBSetProp('REHBEREDITVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Rehber.Rehber_Id')
DBSetProp('REHBEREDITVIEW.rehber_id', 'Field', 'DataType', "C(36)")
DBSetProp('REHBEREDITVIEW.rehber_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for REHBEREDITVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.rehber_tipi field.
DBSetProp('REHBEREDITVIEW.rehber_tipi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.rehber_tipi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.rehber_tipi', 'Field', 'UpdateName', 'dbo.Rehber.Rehber_Tipi')
DBSetProp('REHBEREDITVIEW.rehber_tipi', 'Field', 'DataType', "C(10)")
DBSetProp('REHBEREDITVIEW.rehber_tipi', 'Field', 'DefaultValue', "'Þahýs'")
*** DBCX Field Properties for REHBEREDITVIEW.rehber_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFECDESCRIPT","Rehber Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFECFRMCAPTN","Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFECDLGCAPTN","Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFECGRDCAPTN","Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFECRPTCAPTN","Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFEMTOOLTIP","Tipi                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFEMSTATUSTXT","Tipi                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFEMINLIST",'"Þahýs","Kurum","Banka","Þirket"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.rehber_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.tckimlik_no field.
DBSetProp('REHBEREDITVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Rehber.TcKimlik_No')
DBSetProp('REHBEREDITVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tc Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tc Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tc Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tc Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tc Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tc Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.ticaret_sicil_no field.
DBSetProp('REHBEREDITVIEW.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.ticaret_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Rehber.Ticaret_Sicil_No')
DBSetProp('REHBEREDITVIEW.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Tic. Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Tic. Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Tic. Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Tic. Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Tic. Sicil No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Tic. Sicil No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.adi field.
DBSetProp('REHBEREDITVIEW.adi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.adi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.adi', 'Field', 'UpdateName', 'dbo.Rehber.Adi')
DBSetProp('REHBEREDITVIEW.adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for REHBEREDITVIEW.adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFECDESCRIPT","Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFECFRMCAPTN","Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFECDLGCAPTN","Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFECGRDCAPTN","Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFECRPTCAPTN","Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFEMTOOLTIP","Adý                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFEMSTATUSTXT","Adý                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.isyeri_adi field.
DBSetProp('REHBEREDITVIEW.isyeri_adi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.isyeri_adi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.isyeri_adi', 'Field', 'UpdateName', 'dbo.Rehber.Isyeri_Adi')
DBSetProp('REHBEREDITVIEW.isyeri_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for REHBEREDITVIEW.isyeri_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFECDESCRIPT","Isyeri Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFECFRMCAPTN","Ýþ Yeri Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFECDLGCAPTN","Ýþ Yeri Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFECGRDCAPTN","Ýþ Yeri Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFECRPTCAPTN","Ýþ Yeri Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFEMTOOLTIP","Ýþ Yeri Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFEMSTATUSTXT","Ýþ Yeri Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.isyeri_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.departman field.
DBSetProp('REHBEREDITVIEW.departman', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.departman', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.departman', 'Field', 'UpdateName', 'dbo.Rehber.Departman')
DBSetProp('REHBEREDITVIEW.departman', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for REHBEREDITVIEW.departman
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFECDESCRIPT","Departman Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFECFRMCAPTN","Departman") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFECDLGCAPTN","Departman") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFECGRDCAPTN","Departman") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFECRPTCAPTN","Departman") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFEMTOOLTIP","Departman") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFEMSTATUSTXT","Departman") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.departman","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.is_unvani field.
DBSetProp('REHBEREDITVIEW.is_unvani', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.is_unvani', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.is_unvani', 'Field', 'UpdateName', 'dbo.Rehber.Is_Unvani')
DBSetProp('REHBEREDITVIEW.is_unvani', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.is_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFECDESCRIPT","Is Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFECFRMCAPTN","Ýþ Ünvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFECDLGCAPTN","Ýþ Ünvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFECGRDCAPTN","Ýþ Ünvaný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFECRPTCAPTN","Ýþ Ünvaný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFEMTOOLTIP","Ýþ Ünvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFEMSTATUSTXT","Ýþ Ünvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.is_unvani","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.vergi_no field.
DBSetProp('REHBEREDITVIEW.vergi_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.vergi_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.vergi_no', 'Field', 'UpdateName', 'dbo.Rehber.Vergi_No')
DBSetProp('REHBEREDITVIEW.vergi_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.vergi_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFECDESCRIPT","Vergi No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFECFRMCAPTN","Vergi No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFECDLGCAPTN","Vergi No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFECGRDCAPTN","Vergi No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFECRPTCAPTN","Vergi No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFEMTOOLTIP","Vergi No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFEMSTATUSTXT","Vergi No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_no","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.vergi_dairesi field.
DBSetProp('REHBEREDITVIEW.vergi_dairesi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.vergi_dairesi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.vergi_dairesi', 'Field', 'UpdateName', 'dbo.Rehber.Vergi_Dairesi')
DBSetProp('REHBEREDITVIEW.vergi_dairesi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.vergi_dairesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFECDESCRIPT","Vergi Dairesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFECFRMCAPTN","Vergi Dairesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFECDLGCAPTN","Vergi Dairesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFECGRDCAPTN","Vergi Dairesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFECRPTCAPTN","Vergi Dairesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFEMTOOLTIP","Vergi Dairesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFEMSTATUSTXT","Vergi Dairesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.vergi_dairesi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.ssk_sicil_no field.
DBSetProp('REHBEREDITVIEW.ssk_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.ssk_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.ssk_sicil_no', 'Field', 'UpdateName', 'dbo.Rehber.SSK_Sicil_No')
DBSetProp('REHBEREDITVIEW.ssk_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.ssk_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFECDESCRIPT","Ssk Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFECFRMCAPTN","Ssk Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFECDLGCAPTN","Ssk Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFECGRDCAPTN","Ssk Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFECRPTCAPTN","Ssk Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFEMTOOLTIP","Ssk Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Ssk Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_sicil_no","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.ssk_isyeri_no field.
DBSetProp('REHBEREDITVIEW.ssk_isyeri_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.ssk_isyeri_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.ssk_isyeri_no', 'Field', 'UpdateName', 'dbo.Rehber.SSK_Isyeri_No')
DBSetProp('REHBEREDITVIEW.ssk_isyeri_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.ssk_isyeri_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFECDESCRIPT","Ssk Isyeri No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFECFRMCAPTN","Ssk ÝþYeri No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFECDLGCAPTN","Ssk ÝþYeri No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFECGRDCAPTN","Ssk ÝþYeri No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFECRPTCAPTN","Ssk ÝþYeri No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFEMTOOLTIP","Ssk ÝþYeri No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFEMSTATUSTXT","Ssk ÝþYeri No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ssk_isyeri_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.kimlik_no field.
DBSetProp('REHBEREDITVIEW.kimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.kimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.kimlik_no', 'Field', 'UpdateName', 'dbo.Rehber.Kimlik_No')
DBSetProp('REHBEREDITVIEW.kimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.kimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFECDESCRIPT","Kimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFECFRMCAPTN","Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFECDLGCAPTN","Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFECGRDCAPTN","Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFECRPTCAPTN","Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFEMTOOLTIP","Kimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFEMSTATUSTXT","Kimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.kimlik_no","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.cinsiyeti field.
DBSetProp('REHBEREDITVIEW.cinsiyeti', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.cinsiyeti', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.cinsiyeti', 'Field', 'UpdateName', 'dbo.Rehber.Cinsiyeti')
DBSetProp('REHBEREDITVIEW.cinsiyeti', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for REHBEREDITVIEW.cinsiyeti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECDESCRIPT","Cinsiyeti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECFRMCAPTN","Cinsiyeti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECDLGCAPTN","Cinsiyeti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECGRDCAPTN","Cinsiyeti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECRPTCAPTN","Cinsiyeti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFEMTOOLTIP","Cinsiyeti") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFEMSTATUSTXT","Cinsiyeti") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECLUTABLE","hbysdata!cinsiyetlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECLUTAG","cinsiyeti") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFEMLUFIELDS","cinsiyeti") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFEMLUUPDTEXP","Cinsiyetlookupview.cinsiyeti") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cinsiyeti","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.baba_adi field.
DBSetProp('REHBEREDITVIEW.baba_adi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.baba_adi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.baba_adi', 'Field', 'UpdateName', 'dbo.Rehber.Baba_Adi')
DBSetProp('REHBEREDITVIEW.baba_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.baba_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFECDESCRIPT","Baba Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFECFRMCAPTN","Baba Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFECDLGCAPTN","Baba Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFECGRDCAPTN","Baba Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFECRPTCAPTN","Baba Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFEMTOOLTIP","Baba Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFEMSTATUSTXT","Baba Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.baba_adi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.ana_adi field.
DBSetProp('REHBEREDITVIEW.ana_adi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.ana_adi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.ana_adi', 'Field', 'UpdateName', 'dbo.Rehber.Ana_Adi')
DBSetProp('REHBEREDITVIEW.ana_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.ana_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFECDESCRIPT","Ana Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFECFRMCAPTN","Ana Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFECDLGCAPTN","Ana Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFECGRDCAPTN","Ana Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFECRPTCAPTN","Ana Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFEMTOOLTIP","Ana Adý                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFEMSTATUSTXT","Ana Adý                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ana_adi","FIELD",;
		"VFENDISPORDER",17) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.dogum_yeri field.
DBSetProp('REHBEREDITVIEW.dogum_yeri', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.dogum_yeri', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.dogum_yeri', 'Field', 'UpdateName', 'dbo.Rehber.Dogum_Yeri')
DBSetProp('REHBEREDITVIEW.dogum_yeri', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.dogum_yeri
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFECDESCRIPT","Dogum Yeri Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFECFRMCAPTN","Doðum Yeri") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFECDLGCAPTN","Doðum Yeri") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFECGRDCAPTN","Doðum Yeri") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFECRPTCAPTN","Doðum Yeri") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFEMTOOLTIP","Doðum Yeri                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFEMSTATUSTXT","Doðum Yeri                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_yeri","FIELD",;
		"VFENDISPORDER",18) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.dogum_tarihi field.
DBSetProp('REHBEREDITVIEW.dogum_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.dogum_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.dogum_tarihi', 'Field', 'UpdateName', 'dbo.Rehber.Dogum_Tarihi')
DBSetProp('REHBEREDITVIEW.dogum_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for REHBEREDITVIEW.dogum_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFECDESCRIPT","Dogum Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFECFRMCAPTN","Doðum Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFECDLGCAPTN","Doðum Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFECGRDCAPTN","Doðum Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFECRPTCAPTN","Doðum Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFEMTOOLTIP","Doðum Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFEMSTATUSTXT","Doðum Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.dogum_tarihi","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.medeni_hali field.
DBSetProp('REHBEREDITVIEW.medeni_hali', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.medeni_hali', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.medeni_hali', 'Field', 'UpdateName', 'dbo.Rehber.Medeni_Hali')
DBSetProp('REHBEREDITVIEW.medeni_hali', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for REHBEREDITVIEW.medeni_hali
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECDESCRIPT","Medeni Hali Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECFRMCAPTN","Medeni Hali") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECDLGCAPTN","Medeni Hali") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECGRDCAPTN","Medeni Hali") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECRPTCAPTN","Medeni Hali") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFEMTOOLTIP","Medeni Hali") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFEMSTATUSTXT","Medeni Hali") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECLUTABLE","hbysdata!medenihallookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECLUTAG","medeni_hali") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFEMLUFIELDS","medeni_hali") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFEMLUUPDTEXP","Medenihallookupview.medeni_hali") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.medeni_hali","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.il_adi field.
DBSetProp('REHBEREDITVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.il_adi', 'Field', 'UpdateName', 'dbo.Rehber.Il_Adi')
DBSetProp('REHBEREDITVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.il_adi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.ilce_adi field.
DBSetProp('REHBEREDITVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.Rehber.Ilce_Adi')
DBSetProp('REHBEREDITVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",22) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the REHBEREDITVIEW.mahalle field.
DBSetProp('REHBEREDITVIEW.mahalle', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.mahalle', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.mahalle', 'Field', 'UpdateName', 'dbo.Rehber.Mahalle')
DBSetProp('REHBEREDITVIEW.mahalle', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.mahalle
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFECDESCRIPT","Mahalle Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFECFRMCAPTN","Mahalle") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFECDLGCAPTN","Mahalle") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFECGRDCAPTN","Mahalle") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFECRPTCAPTN","Mahalle") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFEMTOOLTIP","Mahalle") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFEMSTATUSTXT","Mahalle") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.mahalle","FIELD",;
		"VFENDISPORDER",23) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.koy field.
DBSetProp('REHBEREDITVIEW.koy', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.koy', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.koy', 'Field', 'UpdateName', 'dbo.Rehber.Koy')
DBSetProp('REHBEREDITVIEW.koy', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.koy
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFECDESCRIPT","Koy Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFECFRMCAPTN","Köy") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFECDLGCAPTN","Köy") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFECGRDCAPTN","Köy") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFECRPTCAPTN","Köy") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFEMTOOLTIP","Köy                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFEMSTATUSTXT","Köy                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.koy","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.cilt_no field.
DBSetProp('REHBEREDITVIEW.cilt_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.cilt_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.cilt_no', 'Field', 'UpdateName', 'dbo.Rehber.Cilt_No')
DBSetProp('REHBEREDITVIEW.cilt_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for REHBEREDITVIEW.cilt_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFECDESCRIPT","Cilt No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFECFRMCAPTN","Cilt No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFECDLGCAPTN","Cilt No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFECGRDCAPTN","Cilt No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFECRPTCAPTN","Cilt No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFEMTOOLTIP","Cilt No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFEMSTATUSTXT","Cilt No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.cilt_no","FIELD",;
		"VFENDISPORDER",25) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.sira_no field.
DBSetProp('REHBEREDITVIEW.sira_no', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.sira_no', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.sira_no', 'Field', 'UpdateName', 'dbo.Rehber.Sira_No')
DBSetProp('REHBEREDITVIEW.sira_no', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for REHBEREDITVIEW.sira_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFECDESCRIPT","Sira No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFECFRMCAPTN","Sýra No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFECDLGCAPTN","Sýra No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFECGRDCAPTN","Sýra No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFECRPTCAPTN","Sýra No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFEMTOOLTIP","Sýra No                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFEMSTATUSTXT","Sýra No                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.sira_no","FIELD",;
		"VFENDISPORDER",26) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.verildigi_yer field.
DBSetProp('REHBEREDITVIEW.verildigi_yer', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.verildigi_yer', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.verildigi_yer', 'Field', 'UpdateName', 'dbo.Rehber.Verildigi_Yer')
DBSetProp('REHBEREDITVIEW.verildigi_yer', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.verildigi_yer
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFECDESCRIPT","Verildigi Yer Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFECFRMCAPTN","Verildiði Yer") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFECDLGCAPTN","Verildiði Yer") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFECGRDCAPTN","Verildiði Yer") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFECRPTCAPTN","Verildiði Yer") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFEMTOOLTIP","Verildiði Yer                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFEMSTATUSTXT","Verildiði Yer                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verildigi_yer","FIELD",;
		"VFENDISPORDER",27) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.verilis_nedeni field.
DBSetProp('REHBEREDITVIEW.verilis_nedeni', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.verilis_nedeni', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.verilis_nedeni', 'Field', 'UpdateName', 'dbo.Rehber.Verilis_Nedeni')
DBSetProp('REHBEREDITVIEW.verilis_nedeni', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.verilis_nedeni
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFECDESCRIPT","Verilis Nedeni Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFECFRMCAPTN","Veriliþ Nedeni") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFECDLGCAPTN","Veriliþ Nedeni") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFECGRDCAPTN","Veriliþ Nedeni") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFECRPTCAPTN","Veriliþ Nedeni") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFEMTOOLTIP","Veriliþ Nedeni                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFEMSTATUSTXT","Veriliþ Nedeni                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_nedeni","FIELD",;
		"VFENDISPORDER",28) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.verilis_tarihi field.
DBSetProp('REHBEREDITVIEW.verilis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.verilis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.verilis_tarihi', 'Field', 'UpdateName', 'dbo.Rehber.Verilis_Tarihi')
DBSetProp('REHBEREDITVIEW.verilis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for REHBEREDITVIEW.verilis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFECDESCRIPT","Verilis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFECFRMCAPTN","Veriliþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFECDLGCAPTN","Veriliþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFECGRDCAPTN","Veriliþ Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFECRPTCAPTN","Veriliþ Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFEMTOOLTIP","Veriliþ Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Veriliþ Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.verilis_tarihi","FIELD",;
		"VFENDISPORDER",29) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.iletisim_telefonu field.
DBSetProp('REHBEREDITVIEW.iletisim_telefonu', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.iletisim_telefonu', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.iletisim_telefonu', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Telefonu')
DBSetProp('REHBEREDITVIEW.iletisim_telefonu', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REHBEREDITVIEW.iletisim_telefonu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFECDESCRIPT","Iletisim Telefonu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFECFRMCAPTN","Iletisim Telefonu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFECDLGCAPTN","Iletisim Telefonu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFECGRDCAPTN","Iletisim Telefonu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFECRPTCAPTN","Iletisim Telefonu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFEMTOOLTIP","Iletisim Telefonu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFEMSTATUSTXT","Iletisim Telefonu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_telefonu","FIELD",;
		"VFENDISPORDER",30) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.telefon_statusu field.
DBSetProp('REHBEREDITVIEW.telefon_statusu', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.telefon_statusu', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.telefon_statusu', 'Field', 'UpdateName', 'dbo.Rehber.Telefon_Statusu')
DBSetProp('REHBEREDITVIEW.telefon_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.telefon_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFECDESCRIPT","Telefon Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFECFRMCAPTN","Telefon Statusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFECDLGCAPTN","Telefon Statusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFECGRDCAPTN","Telefon Statusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFECRPTCAPTN","Telefon Statusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFEMTOOLTIP","Telefon Statusu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFEMSTATUSTXT","Telefon Statusu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.telefon_statusu","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.iletisim_adresi field.
DBSetProp('REHBEREDITVIEW.iletisim_adresi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.iletisim_adresi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.iletisim_adresi', 'Field', 'UpdateName', 'dbo.Rehber.Iletisim_Adresi')
DBSetProp('REHBEREDITVIEW.iletisim_adresi', 'Field', 'DataType', "C(200)")
*** DBCX Field Properties for REHBEREDITVIEW.iletisim_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFECDESCRIPT","Iletisim Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFECFRMCAPTN","Iletisim Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFECDLGCAPTN","Iletisim Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFECGRDCAPTN","Iletisim Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFECRPTCAPTN","Iletisim Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFEMTOOLTIP","Iletisim Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFEMSTATUSTXT","Iletisim Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.iletisim_adresi","FIELD",;
		"VFENDISPORDER",31) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.adres_statusu field.
DBSetProp('REHBEREDITVIEW.adres_statusu', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.adres_statusu', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.adres_statusu', 'Field', 'UpdateName', 'dbo.Rehber.Adres_Statusu')
DBSetProp('REHBEREDITVIEW.adres_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REHBEREDITVIEW.adres_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFECDESCRIPT","Adres Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFECFRMCAPTN","Adres Statusu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFECDLGCAPTN","Adres Statusu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFECGRDCAPTN","Adres Statusu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFECRPTCAPTN","Adres Statusu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFEMTOOLTIP","Adres Statusu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFEMSTATUSTXT","Adres Statusu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.adres_statusu","FIELD",;
		"VFENDISPORDER",33) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.e_posta field.
DBSetProp('REHBEREDITVIEW.e_posta', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.e_posta', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.e_posta', 'Field', 'UpdateName', 'dbo.Rehber.e_Posta')
DBSetProp('REHBEREDITVIEW.e_posta', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for REHBEREDITVIEW.e_posta
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFECDESCRIPT","E Posta Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFECFRMCAPTN","E Posta") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFECDLGCAPTN","E Posta") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFECGRDCAPTN","E Posta") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFECRPTCAPTN","E Posta") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFEMTOOLTIP","E Posta") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFEMSTATUSTXT","E Posta") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.e_posta","FIELD",;
		"VFENDISPORDER",38) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.web_adresi field.
DBSetProp('REHBEREDITVIEW.web_adresi', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.web_adresi', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.web_adresi', 'Field', 'UpdateName', 'dbo.Rehber.Web_Adresi')
DBSetProp('REHBEREDITVIEW.web_adresi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for REHBEREDITVIEW.web_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFECDESCRIPT","Web Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFECFRMCAPTN","Web") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFECDLGCAPTN","Web") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFECGRDCAPTN","Web") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFECRPTCAPTN","Web") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFEMTOOLTIP","Web                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFEMSTATUSTXT","Web                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.web_adresi","FIELD",;
		"VFENDISPORDER",41) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.resim_id field.
DBSetProp('REHBEREDITVIEW.resim_id', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.resim_id', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.resim_id', 'Field', 'UpdateName', 'dbo.Rehber.Resim_Id')
DBSetProp('REHBEREDITVIEW.resim_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for REHBEREDITVIEW.resim_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFECDESCRIPT","Resim Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFECFRMCAPTN","Resim") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFECDLGCAPTN","Resim") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFECGRDCAPTN","Resim") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFECRPTCAPTN","Resim") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFEMTOOLTIP","Resim                                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFEMSTATUSTXT","Resim                                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_id","FIELD",;
		"VFENDISPORDER",34) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.resim_len field.
DBSetProp('REHBEREDITVIEW.resim_len', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.resim_len', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.resim_len', 'Field', 'UpdateName', 'dbo.Rehber.Resim_Len')
DBSetProp('REHBEREDITVIEW.resim_len', 'Field', 'DataType', "I")
*** DBCX Field Properties for REHBEREDITVIEW.resim_len
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFECDESCRIPT","Resim Len Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFECFRMCAPTN","Resim Len") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFECDLGCAPTN","Resim Len") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFECGRDCAPTN","Resim Len") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFECRPTCAPTN","Resim Len") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFEMTOOLTIP","Resim Len") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFEMSTATUSTXT","Resim Len") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.resim_len","FIELD",;
		"VFENDISPORDER",35) &&Display Order
ENDIF
 
*** Props for the REHBEREDITVIEW.notlar field.
DBSetProp('REHBEREDITVIEW.notlar', 'Field', 'KeyField', .F.)
DBSetProp('REHBEREDITVIEW.notlar', 'Field', 'Updatable', .T.)
DBSetProp('REHBEREDITVIEW.notlar', 'Field', 'UpdateName', 'dbo.Rehber.Notlar')
DBSetProp('REHBEREDITVIEW.notlar', 'Field', 'DataType', "M")
*** DBCX Field Properties for REHBEREDITVIEW.notlar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFECDESCRIPT","Notlar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFECFRMCAPTN","Notlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFECDLGCAPTN","Notlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFECGRDCAPTN","Notlar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFECRPTCAPTN","Notlar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFEMTOOLTIP","Notlar") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFEMSTATUSTXT","Notlar") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REHBEREDITVIEW.notlar","FIELD",;
		"VFENDISPORDER",94) &&Display Order
ENDIF
 
