***************** Begin View Definition ADLIBOLGEVIEW ***************


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



CREATE SQL VIEW "ADLIBOLGEVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Adlibolge.AdliBolge_Id,;
		Adlibolge.Ilce_Adi,;
		Adlibolge.Il_Adi,;
		Adlibolge.Adliye_Adi;
	FROM dbo.AdliBolge Adlibolge

DBSetProp('ADLIBOLGEVIEW', 'View', 'UpdateType', 1)
DBSetProp('ADLIBOLGEVIEW', 'View', 'WhereType', 3)
DBSetProp('ADLIBOLGEVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ADLIBOLGEVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ADLIBOLGEVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ADLIBOLGEVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ADLIBOLGEVIEW', 'View', 'Tables', 'dbo.AdliBolge')
DBSetProp('ADLIBOLGEVIEW', 'View', 'Prepared', .F.)
DBSetProp('ADLIBOLGEVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ADLIBOLGEVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ADLIBOLGEVIEW', 'View', 'FetchSize', -1)
DBSetProp('ADLIBOLGEVIEW', 'View', 'ParameterList', "vp_Ilce_Adi,'C';vp_Il_Adi,'C';vp_Adliye_Adi,'C'")
DBSetProp('ADLIBOLGEVIEW', 'View', 'Comment', "")
DBSetProp('ADLIBOLGEVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ADLIBOLGEVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ADLIBOLGEVIEW
	GoExplorer.odbcx.Validate("ADLIBOLGEVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW","VIEW",;
		"VFECDESCRIPT","Adlibolgeview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Ilce_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Ilce Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Ilce_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Il_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Il Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFENVPSIZE",15) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Il_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Adliye_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Adliye Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.vp_Adliye_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ADLIBOLGEVIEW
*** Props for the ADLIBOLGEVIEW.adlibolge_id field.
DBSetProp('ADLIBOLGEVIEW.adlibolge_id', 'Field', 'KeyField', .T.)
DBSetProp('ADLIBOLGEVIEW.adlibolge_id', 'Field', 'Updatable', .T.)
DBSetProp('ADLIBOLGEVIEW.adlibolge_id', 'Field', 'UpdateName', 'dbo.AdliBolge.AdliBolge_Id')
DBSetProp('ADLIBOLGEVIEW.adlibolge_id', 'Field', 'DataType', "C(36)")
DBSetProp('ADLIBOLGEVIEW.adlibolge_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ADLIBOLGEVIEW.adlibolge_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFECDESCRIPT","Adlibolge Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFECFRMCAPTN","Adli Bölge ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFECDLGCAPTN","Adli Bölge ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFECGRDCAPTN","Adli Bölge ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFECRPTCAPTN","Adli Bölge ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFEMTOOLTIP","Adli Bölge ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFEMSTATUSTXT","Adli Bölge ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adlibolge_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ADLIBOLGEVIEW.ilce_adi field.
DBSetProp('ADLIBOLGEVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('ADLIBOLGEVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('ADLIBOLGEVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.AdliBolge.Ilce_Adi')
DBSetProp('ADLIBOLGEVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ADLIBOLGEVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi, il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ADLIBOLGEVIEW.il_adi field.
DBSetProp('ADLIBOLGEVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('ADLIBOLGEVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('ADLIBOLGEVIEW.il_adi', 'Field', 'UpdateName', 'dbo.AdliBolge.Il_Adi')
DBSetProp('ADLIBOLGEVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ADLIBOLGEVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.il_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ADLIBOLGEVIEW.adliye_adi field.
DBSetProp('ADLIBOLGEVIEW.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('ADLIBOLGEVIEW.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('ADLIBOLGEVIEW.adliye_adi', 'Field', 'UpdateName', 'dbo.AdliBolge.Adliye_Adi')
DBSetProp('ADLIBOLGEVIEW.adliye_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for ADLIBOLGEVIEW.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECLUTABLE","hbysdata!adliyelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECLUTAG","adliye_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFEMLUFIELDS","adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFEMLUUPDTEXP","Adliyelookupview.adliye_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIBOLGEVIEW.adliye_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
