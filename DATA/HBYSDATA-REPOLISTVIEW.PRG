***************** Begin View Definition REPOLISTVIEW ***************


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



CREATE SQL VIEW "REPOLISTVIEW" ; 
	AS SELECT Repolist.cguid,;
		Repolist.ctitle,;
		Repolist.ccategory,;
		Repolist.cclass,;
		Repolist.cbizobj,;
		Repolist.csecurity;
	FROM repolist

DBSetProp('REPOLISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('REPOLISTVIEW', 'View', 'WhereType', 3)
DBSetProp('REPOLISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('REPOLISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('REPOLISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('REPOLISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('REPOLISTVIEW', 'View', 'Tables', 'repolist')
DBSetProp('REPOLISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('REPOLISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('REPOLISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('REPOLISTVIEW', 'View', 'FetchSize', 100)
DBSetProp('REPOLISTVIEW', 'View', 'ParameterList', "vp_cTitle,'C';vp_cCategory,'C'")
DBSetProp('REPOLISTVIEW', 'View', 'Comment', "")
DBSetProp('REPOLISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('REPOLISTVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for REPOLISTVIEW
	GoExplorer.odbcx.Validate("REPOLISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW","VIEW",;
		"VFECDESCRIPT","Repolistview Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_cTitle
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFECDESCRIPT","Vp Ctitle View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFECFRMCAPTN","Rapor Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFECDLGCAPTN","Rapor Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFENVPSIZE",80) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFEMTOOLTIP","Rapor Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFEMSTATUSTXT","Rapor Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFEMCOMPARETO","cTitle") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cTitle","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_cCategory
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFECDESCRIPT","Vp Ccategory View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFECFRMCAPTN","Kategori") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFECDLGCAPTN","Kategori") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFEMTOOLTIP","Kategori                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFEMSTATUSTXT","Kategori                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.vp_cCategory","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!repolistview.ctitle
	GoExplorer.odbcx.AddViewIndex("hbysdata!repolistview","ctitle","CTITLE","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!repolistview.ctitle","INDEX",;
		"VFECDESCRIPT","Ctitle Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!repolistview.ctitle","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!repolistview.ctitle","INDEX",;
		"VFECTAGCAPTN","Ctitle") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!repolistview.ctitle","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for REPOLISTVIEW
*** Props for the REPOLISTVIEW.cguid field.
DBSetProp('REPOLISTVIEW.cguid', 'Field', 'KeyField', .T.)
DBSetProp('REPOLISTVIEW.cguid', 'Field', 'Updatable', .T.)
DBSetProp('REPOLISTVIEW.cguid', 'Field', 'UpdateName', 'repolist.cguid')
DBSetProp('REPOLISTVIEW.cguid', 'Field', 'DataType', "C(16)")
DBSetProp('REPOLISTVIEW.cguid', 'Field', 'DefaultValue', "GUID(16)")
*** DBCX Field Properties for REPOLISTVIEW.cguid
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFECDESCRIPT","Cguid Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFECFRMCAPTN","Cguid") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFECDLGCAPTN","Cguid") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFECGRDCAPTN","Cguid") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFECRPTCAPTN","Cguid") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFEMTOOLTIP","Cguid") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFEMSTATUSTXT","Cguid") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cguid","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the REPOLISTVIEW.ctitle field.
DBSetProp('REPOLISTVIEW.ctitle', 'Field', 'KeyField', .F.)
DBSetProp('REPOLISTVIEW.ctitle', 'Field', 'Updatable', .T.)
DBSetProp('REPOLISTVIEW.ctitle', 'Field', 'UpdateName', 'repolist.ctitle')
DBSetProp('REPOLISTVIEW.ctitle', 'Field', 'DataType', "C(80)")
*** DBCX Field Properties for REPOLISTVIEW.ctitle
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFECDESCRIPT","Ctitle Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFECFRMCAPTN","Rapor Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFECDLGCAPTN","Rapor Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFECGRDCAPTN","Rapor Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFECRPTCAPTN","Rapor Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFEMTOOLTIP","Rapor Adý                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFEMSTATUSTXT","Rapor Adý                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFECQFINDTAG","ctitle") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ctitle","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the REPOLISTVIEW.ccategory field.
DBSetProp('REPOLISTVIEW.ccategory', 'Field', 'KeyField', .F.)
DBSetProp('REPOLISTVIEW.ccategory', 'Field', 'Updatable', .T.)
DBSetProp('REPOLISTVIEW.ccategory', 'Field', 'UpdateName', 'repolist.ccategory')
DBSetProp('REPOLISTVIEW.ccategory', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REPOLISTVIEW.ccategory
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFECDESCRIPT","Ccategory Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFECFRMCAPTN","Kategori") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFECDLGCAPTN","Kategori") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFECGRDCAPTN","Kategori") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFECRPTCAPTN","Kategori") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFEMTOOLTIP","Kategori                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFEMSTATUSTXT","Kategori                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.ccategory","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the REPOLISTVIEW.cclass field.
DBSetProp('REPOLISTVIEW.cclass', 'Field', 'KeyField', .F.)
DBSetProp('REPOLISTVIEW.cclass', 'Field', 'Updatable', .T.)
DBSetProp('REPOLISTVIEW.cclass', 'Field', 'UpdateName', 'repolist.cclass')
DBSetProp('REPOLISTVIEW.cclass', 'Field', 'DataType', "C(128)")
*** DBCX Field Properties for REPOLISTVIEW.cclass
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFECDESCRIPT","Cclass Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFECFRMCAPTN","Cclass") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFECDLGCAPTN","Cclass") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFECGRDCAPTN","Cclass") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFECRPTCAPTN","Cclass") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFEMTOOLTIP","Cclass") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFEMSTATUSTXT","Cclass") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cclass","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the REPOLISTVIEW.cbizobj field.
DBSetProp('REPOLISTVIEW.cbizobj', 'Field', 'KeyField', .F.)
DBSetProp('REPOLISTVIEW.cbizobj', 'Field', 'Updatable', .T.)
DBSetProp('REPOLISTVIEW.cbizobj', 'Field', 'UpdateName', 'repolist.cbizobj')
DBSetProp('REPOLISTVIEW.cbizobj', 'Field', 'DataType', "C(128)")
*** DBCX Field Properties for REPOLISTVIEW.cbizobj
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFECDESCRIPT","Cbizobj Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFECFRMCAPTN","Cbizobj") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFECDLGCAPTN","Cbizobj") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFECGRDCAPTN","Cbizobj") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFECRPTCAPTN","Cbizobj") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFEMTOOLTIP","Cbizobj") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFEMSTATUSTXT","Cbizobj") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.cbizobj","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the REPOLISTVIEW.csecurity field.
DBSetProp('REPOLISTVIEW.csecurity', 'Field', 'KeyField', .F.)
DBSetProp('REPOLISTVIEW.csecurity', 'Field', 'Updatable', .T.)
DBSetProp('REPOLISTVIEW.csecurity', 'Field', 'UpdateName', 'repolist.csecurity')
DBSetProp('REPOLISTVIEW.csecurity', 'Field', 'DataType', "C(40)")
*** DBCX Field Properties for REPOLISTVIEW.csecurity
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFECDESCRIPT","Csecurity Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFECFRMCAPTN","Csecurity") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFECDLGCAPTN","Csecurity") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFECGRDCAPTN","Csecurity") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFECRPTCAPTN","Csecurity") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFEMTOOLTIP","Csecurity") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFEMSTATUSTXT","Csecurity") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!REPOLISTVIEW.csecurity","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
