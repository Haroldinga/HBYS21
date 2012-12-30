***************** Begin View Definition SUBEVIEW ***************


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



CREATE SQL VIEW "SUBEVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Sube.Sube_Id,;
		Sube.Muvekkil_Id,;
		Sube.Muvekkil_Adi,;
		Sube.Sube_Kodu,;
		Sube.Sube_Adi,;
		Sube.Tel,;
		Sube.Faks,;
		Sube.Web_Adresi,;
		Sube.Email,;
		Sube.Adres,;
		Sube.Il_Adi,;
		Sube.Ilce_Adi,;
		Sube.Posta_Kodu,;
		Sube.Ulke;
	FROM dbo.Sube Sube

DBSetProp('SUBEVIEW', 'View', 'UpdateType', 1)
DBSetProp('SUBEVIEW', 'View', 'WhereType', 1)
DBSetProp('SUBEVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('SUBEVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('SUBEVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('SUBEVIEW', 'View', 'MaxRecords', -1)
DBSetProp('SUBEVIEW', 'View', 'Tables', 'dbo.Sube')
DBSetProp('SUBEVIEW', 'View', 'Prepared', .F.)
DBSetProp('SUBEVIEW', 'View', 'CompareMemo', .F.)
DBSetProp('SUBEVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('SUBEVIEW', 'View', 'FetchSize', -1)
DBSetProp('SUBEVIEW', 'View', 'ParameterList', "vp_Muvekkil_Id,'C';vp_Sube_Adi,'C';vp_Muvekkil_Adi,'C'")
DBSetProp('SUBEVIEW', 'View', 'Comment', "")
DBSetProp('SUBEVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('SUBEVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for SUBEVIEW
	GoExplorer.odbcx.Validate("SUBEVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW","VIEW",;
		"VFECDESCRIPT","Subeview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTAG","muvekkil_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCOMPARETO","Muvekkil_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Sube_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Sube Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFEMCOMPARETO","Sube_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Sube_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMCOMPARETO","Muvekkil_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.vp_Muvekkil_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for SUBEVIEW
*** Props for the SUBEVIEW.sube_id field.
DBSetProp('SUBEVIEW.sube_id', 'Field', 'KeyField', .T.)
DBSetProp('SUBEVIEW.sube_id', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.sube_id', 'Field', 'UpdateName', 'dbo.Sube.Sube_Id')
DBSetProp('SUBEVIEW.sube_id', 'Field', 'DataType', "C(36)")
DBSetProp('SUBEVIEW.sube_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for SUBEVIEW.sube_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFECDESCRIPT","Sube Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFECFRMCAPTN","Þube ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFECDLGCAPTN","Þube ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFECGRDCAPTN","Þube ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFECRPTCAPTN","Þube ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFEMTOOLTIP","Þube ID                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFEMSTATUSTXT","Þube ID                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.muvekkil_id field.
DBSetProp('SUBEVIEW.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.Sube.Muvekkil_Id')
DBSetProp('SUBEVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for SUBEVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECLUTAG","muvekkil_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",2) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_id","FIELD",;
		"VFEMLUUPDFLDS","muvekkil_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the SUBEVIEW.muvekkil_adi field.
DBSetProp('SUBEVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Sube.Muvekkil_Adi')
DBSetProp('SUBEVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SUBEVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.sube_kodu field.
DBSetProp('SUBEVIEW.sube_kodu', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.sube_kodu', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.sube_kodu', 'Field', 'UpdateName', 'dbo.Sube.Sube_Kodu')
DBSetProp('SUBEVIEW.sube_kodu', 'Field', 'DataType', "C(5)")
*** DBCX Field Properties for SUBEVIEW.sube_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFECDESCRIPT","Sube Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFECFRMCAPTN","Þube Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFECDLGCAPTN","Þube Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFECGRDCAPTN","Þube Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFECRPTCAPTN","Þube Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFEMTOOLTIP","Þube Kodu                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFEMSTATUSTXT","Þube Kodu                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_kodu","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.sube_adi field.
DBSetProp('SUBEVIEW.sube_adi', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.sube_adi', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.sube_adi', 'Field', 'UpdateName', 'dbo.Sube.Sube_Adi')
DBSetProp('SUBEVIEW.sube_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SUBEVIEW.sube_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFECDESCRIPT","Sube Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFECGRDCAPTN","Þube Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFECRPTCAPTN","Þube Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.sube_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.tel field.
DBSetProp('SUBEVIEW.tel', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.tel', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.tel', 'Field', 'UpdateName', 'dbo.Sube.Tel')
DBSetProp('SUBEVIEW.tel', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SUBEVIEW.tel
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFECDESCRIPT","Tel Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFECFRMCAPTN","Tel") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFECDLGCAPTN","Tel") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFECGRDCAPTN","Tel") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFECRPTCAPTN","Tel") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFEMTOOLTIP","Tel") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFEMSTATUSTXT","Tel") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFECCLASS","aphonefield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.tel","FIELD",;
		"VFEMINPUTMASK","0(999) 999 9999") &&Input Mask
ENDIF
 
*** Props for the SUBEVIEW.faks field.
DBSetProp('SUBEVIEW.faks', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.faks', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.faks', 'Field', 'UpdateName', 'dbo.Sube.Faks')
DBSetProp('SUBEVIEW.faks', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SUBEVIEW.faks
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFECDESCRIPT","Faks Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFECFRMCAPTN","Faks") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFECDLGCAPTN","Faks") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFECGRDCAPTN","Faks") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFECRPTCAPTN","Faks") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFEMTOOLTIP","Faks") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFEMSTATUSTXT","Faks") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFECCLASS","aphonefield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFENDISPORDER",5) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.faks","FIELD",;
		"VFEMINPUTMASK","0(999) 999 9999") &&Input Mask
ENDIF
 
*** Props for the SUBEVIEW.web_adresi field.
DBSetProp('SUBEVIEW.web_adresi', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.web_adresi', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.web_adresi', 'Field', 'UpdateName', 'dbo.Sube.Web_Adresi')
DBSetProp('SUBEVIEW.web_adresi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SUBEVIEW.web_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFECDESCRIPT","Web Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFECFRMCAPTN","Web Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFECDLGCAPTN","Web Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFECGRDCAPTN","Web Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFECRPTCAPTN","Web Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFEMTOOLTIP","Web Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFEMSTATUSTXT","Web Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.web_adresi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.email field.
DBSetProp('SUBEVIEW.email', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.email', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.email', 'Field', 'UpdateName', 'dbo.Sube.Email')
DBSetProp('SUBEVIEW.email', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for SUBEVIEW.email
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFECDESCRIPT","Email Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFECFRMCAPTN","eMail") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFECDLGCAPTN","eMail") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFECGRDCAPTN","eMail") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFECRPTCAPTN","eMail") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFEMTOOLTIP","eMail                                                ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFEMSTATUSTXT","eMail                                                ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.email","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.adres field.
DBSetProp('SUBEVIEW.adres', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.adres', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.adres', 'Field', 'UpdateName', 'dbo.Sube.Adres')
DBSetProp('SUBEVIEW.adres', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for SUBEVIEW.adres
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFECDESCRIPT","Adres Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFECFRMCAPTN","Adres") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFECDLGCAPTN","Adres") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFECGRDCAPTN","Adres") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFECRPTCAPTN","Adres") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFEMTOOLTIP","Adres") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFEMSTATUSTXT","Adres") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.adres","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.il_adi field.
DBSetProp('SUBEVIEW.il_adi', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.il_adi', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.il_adi', 'Field', 'UpdateName', 'dbo.Sube.Il_Adi')
DBSetProp('SUBEVIEW.il_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SUBEVIEW.il_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECDESCRIPT","Il Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECFRMCAPTN","Ýl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECDLGCAPTN","Ýl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECGRDCAPTN","Ýl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECRPTCAPTN","Ýl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFEMTOOLTIP","Ýl Adý                                               ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFEMSTATUSTXT","Ýl Adý                                               ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECLUTABLE","hbysdata!illookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECLUTAG","il_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFEMLUFIELDS","il_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFEMLUUPDTEXP","Illookupview.il_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECCLASS","ail_adifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.il_adi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.ilce_adi field.
DBSetProp('SUBEVIEW.ilce_adi', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.ilce_adi', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.ilce_adi', 'Field', 'UpdateName', 'dbo.Sube.Ilce_Adi')
DBSetProp('SUBEVIEW.ilce_adi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SUBEVIEW.ilce_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECDESCRIPT","Ilce Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECFRMCAPTN","Ýlçe Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECDLGCAPTN","Ýlçe Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECGRDCAPTN","Ýlçe Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECRPTCAPTN","Ýlçe Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFEMTOOLTIP","Ýlçe Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFEMSTATUSTXT","Ýlçe Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECLUTABLE","hbysdata!ilcelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECLUTAG","ilce_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFEMLUFIELDS","ilce_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFEMLUUPDTEXP","Ilcelookupview.ilce_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECCLASS","ailce_adifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFEMCLASSLIB","c:\vfpprojects\hbys09\libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ilce_adi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.posta_kodu field.
DBSetProp('SUBEVIEW.posta_kodu', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.posta_kodu', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.posta_kodu', 'Field', 'UpdateName', 'dbo.Sube.Posta_Kodu')
DBSetProp('SUBEVIEW.posta_kodu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for SUBEVIEW.posta_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFECDESCRIPT","Posta Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFECFRMCAPTN","Posta Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFECDLGCAPTN","Posta Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFECGRDCAPTN","Posta Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFECRPTCAPTN","Posta Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFEMTOOLTIP","Posta Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFEMSTATUSTXT","Posta Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.posta_kodu","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the SUBEVIEW.ulke field.
DBSetProp('SUBEVIEW.ulke', 'Field', 'KeyField', .F.)
DBSetProp('SUBEVIEW.ulke', 'Field', 'Updatable', .T.)
DBSetProp('SUBEVIEW.ulke', 'Field', 'UpdateName', 'dbo.Sube.Ulke')
DBSetProp('SUBEVIEW.ulke', 'Field', 'DataType', "C(25)")
DBSetProp('SUBEVIEW.ulke', 'Field', 'DefaultValue', "'Türkiye'")
*** DBCX Field Properties for SUBEVIEW.ulke
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFECDESCRIPT","Ulke Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFECFRMCAPTN","Ülke") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFECDLGCAPTN","Ülke") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFECGRDCAPTN","Ülke") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFECRPTCAPTN","Ülke") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFEMTOOLTIP","Ülke                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFEMSTATUSTXT","Ülke                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!SUBEVIEW.ulke","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
