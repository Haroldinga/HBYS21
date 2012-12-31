***************** Begin View Definition ILCELOOKUPVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREFERANS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\hbysreferans"
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



CREATE SQL VIEW "ILCELOOKUPVIEW" ; 
	AS SELECT DISTINCT Postakodu.il_adi,;
		Postakodu.ilce_adi;
	FROM hbysreferans!postakodu

DBSetProp('ILCELOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ILCELOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('ILCELOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ILCELOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ILCELOOKUPVIEW', 'View', 'Tables', 'hbysreferans!postakodu')
DBSetProp('ILCELOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('ILCELOOKUPVIEW', 'View', 'ParameterList', "vp_Il_Adi,'C'")
DBSetProp('ILCELOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ILCELOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ILCELOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ILCELOOKUPVIEW
	GoExplorer.odbcx.Validate("ILCELOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","ILCELOOKUPVIEW Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Il_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Il Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECFRMCAPTN","Il Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECDLGCAPTN","Il Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMTOOLTIP","Il Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Il Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMDEFAULT",".NULL.") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ILCELOOKUPVIEW
*** Props for the ILCELOOKUPVIEW.il_adi field.
DBSetProp('ILCELOOKUPVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('ILCELOOKUPVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('ILCELOOKUPVIEW.il_adi', 'Field', 'UpdateName', 'hbysreferans!postakodu.il_adi')
DBSetProp('ILCELOOKUPVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ILCELOOKUPVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ILCELOOKUPVIEW.ilce_adi field.
DBSetProp('ILCELOOKUPVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('ILCELOOKUPVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('ILCELOOKUPVIEW.ilce_adi', 'Field', 'UpdateName', 'hbysreferans!postakodu.ilce_adi')
DBSetProp('ILCELOOKUPVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ILCELOOKUPVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
