***************** Begin View Definition TELEFONVIEW ***************


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



CREATE SQL VIEW "TELEFONVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Telefon.Telefon_Id,;
		Telefon.Telefon_Fk,;
		Telefon.Telefon_Tipi,;
		Telefon.Ulke_Kodu,;
		Telefon.Telefon_No,;
		Telefon.Dahili_No,;
		Telefon.Telefon_Statusu;
	FROM dbo.Telefon Telefon

DBSetProp('TELEFONVIEW', 'View', 'UpdateType', 1)
DBSetProp('TELEFONVIEW', 'View', 'WhereType', 3)
DBSetProp('TELEFONVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TELEFONVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('TELEFONVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TELEFONVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TELEFONVIEW', 'View', 'Tables', 'dbo.Telefon')
DBSetProp('TELEFONVIEW', 'View', 'Prepared', .F.)
DBSetProp('TELEFONVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TELEFONVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TELEFONVIEW', 'View', 'FetchSize', -1)
DBSetProp('TELEFONVIEW', 'View', 'ParameterList', "vp_telefon_fk,'C'")
DBSetProp('TELEFONVIEW', 'View', 'Comment', "")
DBSetProp('TELEFONVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TELEFONVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TELEFONVIEW
	GoExplorer.odbcx.Validate("TELEFONVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW","VIEW",;
		"VFECDESCRIPT","Telefonview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_telefon_fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFECDESCRIPT","Vp Telefon Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFECFRMCAPTN","Telefon FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFECDLGCAPTN","Telefon FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFEMTOOLTIP","Telefon FK                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFEMSTATUSTXT","Telefon FK                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.vp_telefon_fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for TELEFONVIEW
*** Props for the TELEFONVIEW.telefon_id field.
DBSetProp('TELEFONVIEW.telefon_id', 'Field', 'KeyField', .T.)
DBSetProp('TELEFONVIEW.telefon_id', 'Field', 'Updatable', .T.)
DBSetProp('TELEFONVIEW.telefon_id', 'Field', 'UpdateName', 'dbo.Telefon.Telefon_Id')
DBSetProp('TELEFONVIEW.telefon_id', 'Field', 'DataType', "C(36)")
DBSetProp('TELEFONVIEW.telefon_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TELEFONVIEW.telefon_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFECDESCRIPT","Telefon Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFECFRMCAPTN","Telefon ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFECDLGCAPTN","Telefon ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFECGRDCAPTN","Telefon ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFECRPTCAPTN","Telefon ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFEMTOOLTIP","Telefon ID                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFEMSTATUSTXT","Telefon ID                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TELEFONVIEW.telefon_fk field.
DBSetProp('TELEFONVIEW.telefon_fk', 'Field', 'KeyField', .F.)
DBSetProp('TELEFONVIEW.telefon_fk', 'Field', 'Updatable', .T.)
DBSetProp('TELEFONVIEW.telefon_fk', 'Field', 'UpdateName', 'dbo.Telefon.Telefon_Fk')
DBSetProp('TELEFONVIEW.telefon_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TELEFONVIEW.telefon_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFECDESCRIPT","Telefon Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFECFRMCAPTN","Telefon FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFECDLGCAPTN","Telefon FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFECGRDCAPTN","Telefon FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFECRPTCAPTN","Telefon FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFEMTOOLTIP","Telefon FK                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFEMSTATUSTXT","Telefon FK                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TELEFONVIEW.telefon_tipi field.
DBSetProp('TELEFONVIEW.telefon_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TELEFONVIEW.telefon_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TELEFONVIEW.telefon_tipi', 'Field', 'UpdateName', 'dbo.Telefon.Telefon_Tipi')
DBSetProp('TELEFONVIEW.telefon_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TELEFONVIEW.telefon_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECDESCRIPT","Telefon Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECFRMCAPTN","Telefon Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECDLGCAPTN","Telefon Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECGRDCAPTN","Telefon Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECRPTCAPTN","Telefon Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFEMTOOLTIP","Telefon Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFEMSTATUSTXT","Telefon Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!telefontipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECLUTAG","telefon_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFEMLUFIELDS","telefon_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFEMLUUPDTEXP","Telefontipilookupview.telefon_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TELEFONVIEW.ulke_kodu field.
DBSetProp('TELEFONVIEW.ulke_kodu', 'Field', 'KeyField', .F.)
DBSetProp('TELEFONVIEW.ulke_kodu', 'Field', 'Updatable', .T.)
DBSetProp('TELEFONVIEW.ulke_kodu', 'Field', 'UpdateName', 'dbo.Telefon.Ulke_Kodu')
DBSetProp('TELEFONVIEW.ulke_kodu', 'Field', 'DataType', "C(3)")
DBSetProp('TELEFONVIEW.ulke_kodu', 'Field', 'DefaultValue', "'90'")
*** DBCX Field Properties for TELEFONVIEW.ulke_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFECDESCRIPT","Ulke Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFECFRMCAPTN","Ülke Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFECDLGCAPTN","Ülke Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFECGRDCAPTN","Ülke Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFECRPTCAPTN","Ülke Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFEMTOOLTIP","Ülke Kodu                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFEMSTATUSTXT","Ülke Kodu                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.ulke_kodu","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TELEFONVIEW.telefon_no field.
DBSetProp('TELEFONVIEW.telefon_no', 'Field', 'KeyField', .F.)
DBSetProp('TELEFONVIEW.telefon_no', 'Field', 'Updatable', .T.)
DBSetProp('TELEFONVIEW.telefon_no', 'Field', 'UpdateName', 'dbo.Telefon.Telefon_No')
DBSetProp('TELEFONVIEW.telefon_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TELEFONVIEW.telefon_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFECDESCRIPT","Telefon No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFECFRMCAPTN","Telefon No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFECDLGCAPTN","Telefon No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFECGRDCAPTN","Telefon No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFECRPTCAPTN","Telefon No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFEMTOOLTIP","Telefon No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFEMSTATUSTXT","Telefon No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFEMINPUTMASK","(999) 999 99 99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_no","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the TELEFONVIEW.dahili_no field.
DBSetProp('TELEFONVIEW.dahili_no', 'Field', 'KeyField', .F.)
DBSetProp('TELEFONVIEW.dahili_no', 'Field', 'Updatable', .T.)
DBSetProp('TELEFONVIEW.dahili_no', 'Field', 'UpdateName', 'dbo.Telefon.Dahili_No')
DBSetProp('TELEFONVIEW.dahili_no', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for TELEFONVIEW.dahili_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFECDESCRIPT","Dahili No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFECFRMCAPTN","Dahili No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFECDLGCAPTN","Dahili No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFECGRDCAPTN","Dahili No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFECRPTCAPTN","Dahili No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFEMTOOLTIP","Dahili No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFEMSTATUSTXT","Dahili No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.dahili_no","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the TELEFONVIEW.telefon_statusu field.
DBSetProp('TELEFONVIEW.telefon_statusu', 'Field', 'KeyField', .F.)
DBSetProp('TELEFONVIEW.telefon_statusu', 'Field', 'Updatable', .T.)
DBSetProp('TELEFONVIEW.telefon_statusu', 'Field', 'UpdateName', 'dbo.Telefon.Telefon_Statusu')
DBSetProp('TELEFONVIEW.telefon_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TELEFONVIEW.telefon_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECDESCRIPT","Telefon Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECFRMCAPTN","Telefon Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECDLGCAPTN","Telefon Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECGRDCAPTN","Telefon Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECRPTCAPTN","Telefon Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFEMTOOLTIP","Telefon Statüsü                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFEMSTATUSTXT","Telefon Statüsü                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECLUTABLE","hbysdata!telefonstatusulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECLUTAG","telefon_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFEMLUFIELDS","telefon_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFEMLUUPDTEXP","Telefonstatusulookupview.telefon_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TELEFONVIEW.telefon_statusu","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
