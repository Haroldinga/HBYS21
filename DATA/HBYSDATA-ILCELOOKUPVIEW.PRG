***************** Begin View Definition ILCELOOKUPVIEW ***************


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



CREATE SQL VIEW "ILCELOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT DISTINCT Postakodu.Il_Adi,;
		Postakodu.Ilce_Adi;
	FROM dbo.PostaKodu Postakodu

DBSetProp('ILCELOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('ILCELOOKUPVIEW', 'View', 'WhereType', 1)
DBSetProp('ILCELOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ILCELOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ILCELOOKUPVIEW', 'View', 'Tables', 'dbo.PostaKodu')
DBSetProp('ILCELOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ILCELOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('ILCELOOKUPVIEW', 'View', 'ParameterList', "vp_Il_Adi,'C'")
DBSetProp('ILCELOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('ILCELOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ILCELOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ILCELOOKUPVIEW
	GoExplorer.odbcx.Validate("ILCELOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Ilcelookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW","VIEW",;
		"VFECCLASS","icursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Default Cursor Class Library
 
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
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMTOOLTIP","Il Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Il Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFECCLASS","idynamicviewparameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Behavior Class Library
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
DBSetProp('ILCELOOKUPVIEW.il_adi', 'Field', 'Updatable', .F.)
DBSetProp('ILCELOOKUPVIEW.il_adi', 'Field', 'UpdateName', 'dbo.PostaKodu.Il_Adi')
DBSetProp('ILCELOOKUPVIEW.il_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ILCELOOKUPVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","iL Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","iL Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","iL Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","iL Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","iL Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ILCELOOKUPVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","iL Adý                                               ") &&Status Bar Text
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
DBSetProp('ILCELOOKUPVIEW.ilce_adi', 'Field', 'Updatable', .F.)
DBSetProp('ILCELOOKUPVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.PostaKodu.Ilce_Adi')
DBSetProp('ILCELOOKUPVIEW.ilce_adi', 'Field', 'DataType', "C(25)")
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
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
