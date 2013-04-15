***************** Begin View Definition TEBLIGATVIEW ***************


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



CREATE SQL VIEW "TEBLIGATVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Tebligat.Tebligat_Id,;
		Tebligat.Tebligat_Fk,;
		Tebligat.Tebligat_Tipi,;
		Tebligat.Taraf_Tipi,;
		Tebligat.Tebligat_Tarihi,;
		Tebligat.Teblig_Tarihi,;
		Tebligat.Tebligat_Sonucu,;
		Tebligat.Kesinlesme_Tarihi,;
		Tebligat.Bila_Tarihi,;
		Tebligat.Aciklama;
	FROM dbo.Tebligat Tebligat

DBSetProp('TEBLIGATVIEW', 'View', 'UpdateType', 1)
DBSetProp('TEBLIGATVIEW', 'View', 'WhereType', 3)
DBSetProp('TEBLIGATVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TEBLIGATVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('TEBLIGATVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TEBLIGATVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TEBLIGATVIEW', 'View', 'Tables', 'dbo.Tebligat')
DBSetProp('TEBLIGATVIEW', 'View', 'Prepared', .F.)
DBSetProp('TEBLIGATVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TEBLIGATVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TEBLIGATVIEW', 'View', 'FetchSize', -1)
DBSetProp('TEBLIGATVIEW', 'View', 'ParameterList', "vp_Tebligat_Fk,'C'")
DBSetProp('TEBLIGATVIEW', 'View', 'Comment', "")
DBSetProp('TEBLIGATVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TEBLIGATVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TEBLIGATVIEW
	GoExplorer.odbcx.Validate("TEBLIGATVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW","VIEW",;
		"VFECDESCRIPT","Tebligatview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Tebligat_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Tebligat Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFECFRMCAPTN","Tebligat Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFECDLGCAPTN","Tebligat Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFEMTOOLTIP","Tebligat Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Tebligat Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFEMCOMPARETO","Tebligat_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.vp_Tebligat_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for TEBLIGATVIEW
*** Props for the TEBLIGATVIEW.tebligat_id field.
DBSetProp('TEBLIGATVIEW.tebligat_id', 'Field', 'KeyField', .T.)
DBSetProp('TEBLIGATVIEW.tebligat_id', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.tebligat_id', 'Field', 'UpdateName', 'dbo.Tebligat.Tebligat_Id')
DBSetProp('TEBLIGATVIEW.tebligat_id', 'Field', 'DataType', "C(36)")
DBSetProp('TEBLIGATVIEW.tebligat_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TEBLIGATVIEW.tebligat_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFECDESCRIPT","Tebligat Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFECFRMCAPTN","Tebligat ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFECDLGCAPTN","Tebligat ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFECGRDCAPTN","Tebligat ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFECRPTCAPTN","Tebligat ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFEMTOOLTIP","Tebligat ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFEMSTATUSTXT","Tebligat ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TEBLIGATVIEW.tebligat_fk field.
DBSetProp('TEBLIGATVIEW.tebligat_fk', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATVIEW.tebligat_fk', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.tebligat_fk', 'Field', 'UpdateName', 'dbo.Tebligat.Tebligat_Fk')
DBSetProp('TEBLIGATVIEW.tebligat_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TEBLIGATVIEW.tebligat_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFECDESCRIPT","Tebligat Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFECFRMCAPTN","Tebligat FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFECDLGCAPTN","Tebligat FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFECGRDCAPTN","Tebligat FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFECRPTCAPTN","Tebligat FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFEMTOOLTIP","Tebligat FK                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFEMSTATUSTXT","Tebligat FK                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TEBLIGATVIEW.tebligat_tipi field.
DBSetProp('TEBLIGATVIEW.tebligat_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATVIEW.tebligat_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.tebligat_tipi', 'Field', 'UpdateName', 'dbo.Tebligat.Tebligat_Tipi')
DBSetProp('TEBLIGATVIEW.tebligat_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TEBLIGATVIEW.tebligat_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECDESCRIPT","Tebligat Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECFRMCAPTN","Tebligat Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECDLGCAPTN","Tebligat Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECGRDCAPTN","Tebligat Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECRPTCAPTN","Tebligat Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFEMTOOLTIP","Tebligat Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFEMSTATUSTXT","Tebligat Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!tebligattipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECLUTAG","tebligat_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFEMLUFIELDS","tebligat_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFEMLUUPDTEXP","Tebligattipilookupview.tebligat_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TEBLIGATVIEW.taraf_tipi field.
DBSetProp('TEBLIGATVIEW.taraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATVIEW.taraf_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.taraf_tipi', 'Field', 'UpdateName', 'dbo.Tebligat.Taraf_Tipi')
DBSetProp('TEBLIGATVIEW.taraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TEBLIGATVIEW.taraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECDESCRIPT","Taraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECFRMCAPTN","Taraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECDLGCAPTN","Taraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECGRDCAPTN","Taraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECRPTCAPTN","Taraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFEMTOOLTIP","Taraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Taraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!taraftipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECLUTAG","taraf_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFEMLUFIELDS","taraf_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFEMLUUPDTEXP","Taraftipilookupview.taraf_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECADDFORM","TARAFTIPILOOKUPVIEWEDITFORM") &&Look Up Add Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.taraf_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TEBLIGATVIEW.tebligat_tarihi field.
DBSetProp('TEBLIGATVIEW.tebligat_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATVIEW.tebligat_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.tebligat_tarihi', 'Field', 'UpdateName', 'dbo.Tebligat.Tebligat_Tarihi')
DBSetProp('TEBLIGATVIEW.tebligat_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TEBLIGATVIEW.tebligat_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFECDESCRIPT","Tebligat Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFECFRMCAPTN","Tebligat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFECDLGCAPTN","Tebligat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFECGRDCAPTN","Tebligat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFECRPTCAPTN","Tebligat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFEMTOOLTIP","Tebligat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFEMSTATUSTXT","Tebligat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_tarihi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TEBLIGATVIEW.teblig_tarihi field.
DBSetProp('TEBLIGATVIEW.teblig_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATVIEW.teblig_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.teblig_tarihi', 'Field', 'UpdateName', 'dbo.Tebligat.Teblig_Tarihi')
DBSetProp('TEBLIGATVIEW.teblig_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for TEBLIGATVIEW.teblig_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFECDESCRIPT","Teblig Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFECFRMCAPTN","Teblig Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFECDLGCAPTN","Teblig Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFECGRDCAPTN","Teblig Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFECRPTCAPTN","Teblig Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFEMTOOLTIP","Teblig Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFEMSTATUSTXT","Teblig Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.teblig_tarihi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TEBLIGATVIEW.tebligat_sonucu field.
DBSetProp('TEBLIGATVIEW.tebligat_sonucu', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATVIEW.tebligat_sonucu', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.tebligat_sonucu', 'Field', 'UpdateName', 'dbo.Tebligat.Tebligat_Sonucu')
DBSetProp('TEBLIGATVIEW.tebligat_sonucu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TEBLIGATVIEW.tebligat_sonucu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFECDESCRIPT","Tebligat Sonucu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFECFRMCAPTN","Tebliðat Sonucu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFECDLGCAPTN","Tebliðat Sonucu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFECGRDCAPTN","Tebliðat Sonucu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFECRPTCAPTN","Tebliðat Sonucu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFEMTOOLTIP","Tebliðat Sonucu                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFEMSTATUSTXT","Tebliðat Sonucu                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.tebligat_sonucu","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the TEBLIGATVIEW.kesinlesme_tarihi field.
DBSetProp('TEBLIGATVIEW.kesinlesme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATVIEW.kesinlesme_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.kesinlesme_tarihi', 'Field', 'UpdateName', 'dbo.Tebligat.Kesinlesme_Tarihi')
DBSetProp('TEBLIGATVIEW.kesinlesme_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TEBLIGATVIEW.kesinlesme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFECDESCRIPT","Kesinlesme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFECFRMCAPTN","Kesinleþme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFECDLGCAPTN","Kesinleþme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFECGRDCAPTN","Kesinleþme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFECRPTCAPTN","Kesinleþme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMTOOLTIP","Kesinleþme Tarihi                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Kesinleþme Tarihi                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.kesinlesme_tarihi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TEBLIGATVIEW.bila_tarihi field.
DBSetProp('TEBLIGATVIEW.bila_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATVIEW.bila_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.bila_tarihi', 'Field', 'UpdateName', 'dbo.Tebligat.Bila_Tarihi')
DBSetProp('TEBLIGATVIEW.bila_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for TEBLIGATVIEW.bila_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFECDESCRIPT","Bila Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFECFRMCAPTN","Bila Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFECDLGCAPTN","Bila Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFECGRDCAPTN","Bila Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFECRPTCAPTN","Bila Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFEMTOOLTIP","Bila Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFEMSTATUSTXT","Bila Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.bila_tarihi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the TEBLIGATVIEW.aciklama field.
DBSetProp('TEBLIGATVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('TEBLIGATVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('TEBLIGATVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Tebligat.Aciklama')
DBSetProp('TEBLIGATVIEW.aciklama', 'Field', 'DataType', "M")
*** DBCX Field Properties for TEBLIGATVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEBLIGATVIEW.aciklama","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
