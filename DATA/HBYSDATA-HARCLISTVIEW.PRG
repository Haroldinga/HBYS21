***************** Begin View Definition HARCLISTVIEW ***************


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



CREATE SQL VIEW "HARCLISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Harc.Harc_Id,;
		Harc.Harc_fk,;
		Harc.Harc_Tarihi,;
		Harc.Harc_Tipi,;
		Harc.Harc_Orani,;
		Harc.Harc_Miktari,;
		Harc.Uygulama_Asamasi;
	FROM dbo.Harc Harc

DBSetProp('HARCLISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('HARCLISTVIEW', 'View', 'WhereType', 3)
DBSetProp('HARCLISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('HARCLISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('HARCLISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('HARCLISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('HARCLISTVIEW', 'View', 'Tables', 'dbo.Harc')
DBSetProp('HARCLISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('HARCLISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('HARCLISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HARCLISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('HARCLISTVIEW', 'View', 'ParameterList', "vp_Harc_fk,'C'")
DBSetProp('HARCLISTVIEW', 'View', 'Comment', "")
DBSetProp('HARCLISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('HARCLISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for HARCLISTVIEW
	GoExplorer.odbcx.Validate("HARCLISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW","VIEW",;
		"VFECDESCRIPT","Harclistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Harc_fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFECDESCRIPT","Vp Harc Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFECFRMCAPTN","Harc Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFECDLGCAPTN","Harc Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFEMTOOLTIP","Harc Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFEMSTATUSTXT","Harc Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFEMCOMPARETO","Harc_Fk") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.vp_Harc_fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!harclistview.harctarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!harclistview","harctarh","HARC_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!harclistview.harctarh","INDEX",;
		"VFECDESCRIPT","Harctarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!harclistview.harctarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!harclistview.harctarh","INDEX",;
		"VFECTAGCAPTN","Harctarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!harclistview.harctarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for HARCLISTVIEW
*** Props for the HARCLISTVIEW.harc_id field.
DBSetProp('HARCLISTVIEW.harc_id', 'Field', 'KeyField', .T.)
DBSetProp('HARCLISTVIEW.harc_id', 'Field', 'Updatable', .T.)
DBSetProp('HARCLISTVIEW.harc_id', 'Field', 'UpdateName', 'dbo.Harc.Harc_Id')
DBSetProp('HARCLISTVIEW.harc_id', 'Field', 'DataType', "C(36)")
DBSetProp('HARCLISTVIEW.harc_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for HARCLISTVIEW.harc_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFECDESCRIPT","Harc Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFECFRMCAPTN","Harç ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFECDLGCAPTN","Harç ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFECGRDCAPTN","Harç ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFECRPTCAPTN","Harç ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFEMTOOLTIP","Harç ID                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFEMSTATUSTXT","Harç ID                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the HARCLISTVIEW.harc_fk field.
DBSetProp('HARCLISTVIEW.harc_fk', 'Field', 'KeyField', .F.)
DBSetProp('HARCLISTVIEW.harc_fk', 'Field', 'Updatable', .T.)
DBSetProp('HARCLISTVIEW.harc_fk', 'Field', 'UpdateName', 'dbo.Harc.Harc_fk')
DBSetProp('HARCLISTVIEW.harc_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for HARCLISTVIEW.harc_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFECDESCRIPT","Harc Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFECFRMCAPTN","Harç FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFECDLGCAPTN","Harç FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFECGRDCAPTN","Harç FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFECRPTCAPTN","Harç FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFEMTOOLTIP","Harç FK                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFEMSTATUSTXT","Harç FK                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the HARCLISTVIEW.harc_tarihi field.
DBSetProp('HARCLISTVIEW.harc_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('HARCLISTVIEW.harc_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('HARCLISTVIEW.harc_tarihi', 'Field', 'UpdateName', 'dbo.Harc.Harc_Tarihi')
DBSetProp('HARCLISTVIEW.harc_tarihi', 'Field', 'DataType', "D")
DBSetProp('HARCLISTVIEW.harc_tarihi', 'Field', 'DefaultValue', "Date()")
*** DBCX Field Properties for HARCLISTVIEW.harc_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFECDESCRIPT","Harc Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFECFRMCAPTN","Harç Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFECDLGCAPTN","Harç Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFECGRDCAPTN","Harç Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFECRPTCAPTN","Harç Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFEMTOOLTIP","Harç Tarihi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFEMSTATUSTXT","Harç Tarihi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFECQFINDTAG","harctarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tarihi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the HARCLISTVIEW.harc_tipi field.
DBSetProp('HARCLISTVIEW.harc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('HARCLISTVIEW.harc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HARCLISTVIEW.harc_tipi', 'Field', 'UpdateName', 'dbo.Harc.Harc_Tipi')
DBSetProp('HARCLISTVIEW.harc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HARCLISTVIEW.harc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECDESCRIPT","Harc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECFRMCAPTN","Harç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECDLGCAPTN","Harç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECGRDCAPTN","Harç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECRPTCAPTN","Harç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFEMTOOLTIP","Harç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFEMSTATUSTXT","Harç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!harctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECLUTAG","harc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFEMLUFIELDS","harc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFEMLUUPDTEXP","Harctipilookupview.harc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_tipi","FIELD",;
		"VFEMLUUPDFLDS","harc_miktari, harc_orani") &&After Lookup Update Field List
ENDIF
 
*** Props for the HARCLISTVIEW.harc_orani field.
DBSetProp('HARCLISTVIEW.harc_orani', 'Field', 'KeyField', .F.)
DBSetProp('HARCLISTVIEW.harc_orani', 'Field', 'Updatable', .T.)
DBSetProp('HARCLISTVIEW.harc_orani', 'Field', 'UpdateName', 'dbo.Harc.Harc_Orani')
DBSetProp('HARCLISTVIEW.harc_orani', 'Field', 'DataType', "N(6,3)")
*** DBCX Field Properties for HARCLISTVIEW.harc_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFECDESCRIPT","Harc Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFECFRMCAPTN","Harç Oraný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFECDLGCAPTN","Harç Oraný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFECGRDCAPTN","Harç Oraný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFECRPTCAPTN","Harç Oraný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFEMTOOLTIP","Harç Oraný                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFEMSTATUSTXT","Harç Oraný                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFEMINPUTMASK","99.9999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_orani","FIELD",;
		"VFEMFORMAT","KR") &&Format
ENDIF
 
*** Props for the HARCLISTVIEW.harc_miktari field.
DBSetProp('HARCLISTVIEW.harc_miktari', 'Field', 'KeyField', .F.)
DBSetProp('HARCLISTVIEW.harc_miktari', 'Field', 'Updatable', .T.)
DBSetProp('HARCLISTVIEW.harc_miktari', 'Field', 'UpdateName', 'dbo.Harc.Harc_Miktari')
DBSetProp('HARCLISTVIEW.harc_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCLISTVIEW.harc_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFECDESCRIPT","Harc Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFECFRMCAPTN","Harç Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFECDLGCAPTN","Harç Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFECGRDCAPTN","Harç Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFECRPTCAPTN","Harç Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFEMTOOLTIP","Harç Miktarý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFEMSTATUSTXT","Harç Miktarý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFEMINPUTMASK","9,999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.harc_miktari","FIELD",;
		"VFEMFORMAT","KR") &&Format
ENDIF
 
*** Props for the HARCLISTVIEW.uygulama_asamasi field.
DBSetProp('HARCLISTVIEW.uygulama_asamasi', 'Field', 'KeyField', .F.)
DBSetProp('HARCLISTVIEW.uygulama_asamasi', 'Field', 'Updatable', .T.)
DBSetProp('HARCLISTVIEW.uygulama_asamasi', 'Field', 'UpdateName', 'dbo.Harc.Uygulama_Asamasi')
DBSetProp('HARCLISTVIEW.uygulama_asamasi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HARCLISTVIEW.uygulama_asamasi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECDESCRIPT","Uygulama Asamasi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECFRMCAPTN","Uygulama Aþamasý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECDLGCAPTN","Uygulama Aþamasý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECGRDCAPTN","Uygulama Aþamasý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECRPTCAPTN","Uygulama Aþamasý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMTOOLTIP","Uygulama Aþamasý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMSTATUSTXT","Uygulama Aþamasý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECLUTABLE","hbysdata!icradosyaasamasilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECLUTAG","dosya_asamasi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMLUFIELDS","dosya_asamasi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMLUUPDTEXP","Icradosyaasamasilookupview.dosya_asamasi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCLISTVIEW.uygulama_asamasi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
