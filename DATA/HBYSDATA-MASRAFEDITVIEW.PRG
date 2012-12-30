***************** Begin View Definition MASRAFEDITVIEW ***************


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



CREATE SQL VIEW "MASRAFEDITVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Masraf.Masraf_Id,;
		Masraf.Masraf_fk,;
		Masraf.Muamele_Id,;
		Masraf.Masraf_Tipi,;
		Masraf.Masraf_Tarihi,;
		Masraf.Masraf_Miktari,;
		Masraf.Uygulama_Asamasi,;
		Masraf.Personel_Id,;
		Masraf.Personel_Adi,;
		Masraf.Aciklama;
	FROM dbo.Masraf Masraf

DBSetProp('MASRAFEDITVIEW', 'View', 'UpdateType', 1)
DBSetProp('MASRAFEDITVIEW', 'View', 'WhereType', 1)
DBSetProp('MASRAFEDITVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MASRAFEDITVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MASRAFEDITVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MASRAFEDITVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MASRAFEDITVIEW', 'View', 'Tables', 'dbo.Masraf')
DBSetProp('MASRAFEDITVIEW', 'View', 'Prepared', .F.)
DBSetProp('MASRAFEDITVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MASRAFEDITVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MASRAFEDITVIEW', 'View', 'FetchSize', -1)
DBSetProp('MASRAFEDITVIEW', 'View', 'ParameterList', "vp_Masraf_Id,'C';vp_Muamele_Id,'C'")
DBSetProp('MASRAFEDITVIEW', 'View', 'Comment', "")
DBSetProp('MASRAFEDITVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MASRAFEDITVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MASRAFEDITVIEW
	GoExplorer.odbcx.Validate("MASRAFEDITVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW","VIEW",;
		"VFECDESCRIPT","MasrafEditView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Masraf_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Masraf Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFECFRMCAPTN","Masraf Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFECDLGCAPTN","Masraf Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFEMTOOLTIP","Masraf Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFEMSTATUSTXT","Masraf Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Masraf_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.vp_Muamele_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for MASRAFEDITVIEW
*** Props for the MASRAFEDITVIEW.masraf_id field.
DBSetProp('MASRAFEDITVIEW.masraf_id', 'Field', 'KeyField', .T.)
DBSetProp('MASRAFEDITVIEW.masraf_id', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.masraf_id', 'Field', 'UpdateName', 'dbo.Masraf.Masraf_Id')
DBSetProp('MASRAFEDITVIEW.masraf_id', 'Field', 'DataType', "C(36)")
DBSetProp('MASRAFEDITVIEW.masraf_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MASRAFEDITVIEW.masraf_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFECDESCRIPT","Masraf Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFECFRMCAPTN","Masraf ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFECDLGCAPTN","Masraf ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFECGRDCAPTN","Masraf ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFECRPTCAPTN","Masraf ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFEMTOOLTIP","Masraf ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFEMSTATUSTXT","Masraf ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MASRAFEDITVIEW.masraf_fk field.
DBSetProp('MASRAFEDITVIEW.masraf_fk', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFEDITVIEW.masraf_fk', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.masraf_fk', 'Field', 'UpdateName', 'dbo.Masraf.Masraf_fk')
DBSetProp('MASRAFEDITVIEW.masraf_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MASRAFEDITVIEW.masraf_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFECDESCRIPT","Masraf Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFECFRMCAPTN","Masraf FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFECDLGCAPTN","Masraf FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFECGRDCAPTN","Masraf FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFECRPTCAPTN","Masraf FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFEMTOOLTIP","Masraf FK                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFEMSTATUSTXT","Masraf FK                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MASRAFEDITVIEW.muamele_id field.
DBSetProp('MASRAFEDITVIEW.muamele_id', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFEDITVIEW.muamele_id', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.muamele_id', 'Field', 'UpdateName', 'dbo.Masraf.Muamele_Id')
DBSetProp('MASRAFEDITVIEW.muamele_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MASRAFEDITVIEW.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.muamele_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MASRAFEDITVIEW.masraf_tipi field.
DBSetProp('MASRAFEDITVIEW.masraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFEDITVIEW.masraf_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.masraf_tipi', 'Field', 'UpdateName', 'dbo.Masraf.Masraf_Tipi')
DBSetProp('MASRAFEDITVIEW.masraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFEDITVIEW.masraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECDESCRIPT","Masraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!masraftipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECLUTAG","masraf_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFEMLUFIELDS","masraf_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFEMLUUPDTEXP","Masraftipilookupview.masraf_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tipi","FIELD",;
		"VFEMLUUPDFLDS","masraf_miktari") &&After Lookup Update Field List
ENDIF
 
*** Props for the MASRAFEDITVIEW.masraf_tarihi field.
DBSetProp('MASRAFEDITVIEW.masraf_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFEDITVIEW.masraf_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.masraf_tarihi', 'Field', 'UpdateName', 'dbo.Masraf.Masraf_Tarihi')
DBSetProp('MASRAFEDITVIEW.masraf_tarihi', 'Field', 'Caption', "Masraf Tarihi")
DBSetProp('MASRAFEDITVIEW.masraf_tarihi', 'Field', 'DataType', "D")
DBSetProp('MASRAFEDITVIEW.masraf_tarihi', 'Field', 'DefaultValue', "date()")
*** DBCX Field Properties for MASRAFEDITVIEW.masraf_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFECDESCRIPT","Masraf Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFECFRMCAPTN","Masraf Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFECDLGCAPTN","Masraf Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFECGRDCAPTN","Masraf Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFECRPTCAPTN","Masraf Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFEMTOOLTIP","Masraf Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_tarihi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MASRAFEDITVIEW.masraf_miktari field.
DBSetProp('MASRAFEDITVIEW.masraf_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFEDITVIEW.masraf_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.masraf_miktari', 'Field', 'UpdateName', 'dbo.Masraf.Masraf_Miktari')
DBSetProp('MASRAFEDITVIEW.masraf_miktari', 'Field', 'Caption', "Masraf Miktarý")
DBSetProp('MASRAFEDITVIEW.masraf_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MASRAFEDITVIEW.masraf_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFECDESCRIPT","Masraf Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFECFRMCAPTN","Masraf Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFECDLGCAPTN","Masraf Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFECGRDCAPTN","Masraf Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFECRPTCAPTN","Masraf Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFEMTOOLTIP","Masraf Miktarý") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFEMSTATUSTXT","Masraf Miktarý") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFEMINPUTMASK","99,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.masraf_miktari","FIELD",;
		"VFEMFORMAT","KR") &&Format
ENDIF
 
*** Props for the MASRAFEDITVIEW.uygulama_asamasi field.
DBSetProp('MASRAFEDITVIEW.uygulama_asamasi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFEDITVIEW.uygulama_asamasi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.uygulama_asamasi', 'Field', 'UpdateName', 'dbo.Masraf.Uygulama_Asamasi')
DBSetProp('MASRAFEDITVIEW.uygulama_asamasi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFEDITVIEW.uygulama_asamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECDESCRIPT","Uygulama Asamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECFRMCAPTN","Uygulama Aþamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECDLGCAPTN","Uygulama Aþamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECGRDCAPTN","Uygulama Aþamasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECRPTCAPTN","Uygulama Aþamasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFEMTOOLTIP","Uygulama Aþamasý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFEMSTATUSTXT","Uygulama Aþamasý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECLUTABLE","hbysdata!icradosyaasamasilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECLUTAG","dosya_asamasi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFEMLUFIELDS","dosya_asamasi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFEMLUUPDTEXP","Icradosyaasamasilookupview.dosya_asamasi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.uygulama_asamasi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MASRAFEDITVIEW.personel_id field.
DBSetProp('MASRAFEDITVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFEDITVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Masraf.Personel_Id')
DBSetProp('MASRAFEDITVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MASRAFEDITVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_id","FIELD",;
		"VFEMLUUPDFLDS","personel_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the MASRAFEDITVIEW.personel_adi field.
DBSetProp('MASRAFEDITVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFEDITVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Masraf.Personel_Adi')
DBSetProp('MASRAFEDITVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MASRAFEDITVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MASRAFEDITVIEW.aciklama field.
DBSetProp('MASRAFEDITVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFEDITVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFEDITVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Masraf.Aciklama')
DBSetProp('MASRAFEDITVIEW.aciklama', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for MASRAFEDITVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFEDITVIEW.aciklama","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
