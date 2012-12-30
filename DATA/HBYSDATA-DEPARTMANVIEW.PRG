***************** Begin View Definition DEPARTMANVIEW ***************


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



CREATE SQL VIEW "DEPARTMANVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Departman.Departman_Id,;
		Departman.Departman_Adi,;
		Departman.Departman_Tanimi;
	FROM dbo.Departman Departman

DBSetProp('DEPARTMANVIEW', 'View', 'UpdateType', 1)
DBSetProp('DEPARTMANVIEW', 'View', 'WhereType', 3)
DBSetProp('DEPARTMANVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DEPARTMANVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('DEPARTMANVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DEPARTMANVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DEPARTMANVIEW', 'View', 'Tables', 'dbo.Departman')
DBSetProp('DEPARTMANVIEW', 'View', 'Prepared', .F.)
DBSetProp('DEPARTMANVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DEPARTMANVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DEPARTMANVIEW', 'View', 'FetchSize', -1)
DBSetProp('DEPARTMANVIEW', 'View', 'ParameterList', "vp_Departman_Adi,'C'")
DBSetProp('DEPARTMANVIEW', 'View', 'Comment', "")
DBSetProp('DEPARTMANVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DEPARTMANVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DEPARTMANVIEW
	GoExplorer.odbcx.Validate("DEPARTMANVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW","VIEW",;
		"VFECDESCRIPT","Departmanview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Departman_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Departman Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECFRMCAPTN","Departman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECDLGCAPTN","Departman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMTOOLTIP","Departman Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Departman Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for DEPARTMANVIEW
*** Props for the DEPARTMANVIEW.departman_id field.
DBSetProp('DEPARTMANVIEW.departman_id', 'Field', 'KeyField', .T.)
DBSetProp('DEPARTMANVIEW.departman_id', 'Field', 'Updatable', .T.)
DBSetProp('DEPARTMANVIEW.departman_id', 'Field', 'UpdateName', 'dbo.Departman.Departman_Id')
DBSetProp('DEPARTMANVIEW.departman_id', 'Field', 'DataType', "C(36)")
DBSetProp('DEPARTMANVIEW.departman_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for DEPARTMANVIEW.departman_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFECDESCRIPT","Departman Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFECFRMCAPTN","Departman ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFECDLGCAPTN","Departman ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFECGRDCAPTN","Departman ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFECRPTCAPTN","Departman ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFEMTOOLTIP","Departman ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFEMSTATUSTXT","Departman ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DEPARTMANVIEW.departman_adi field.
DBSetProp('DEPARTMANVIEW.departman_adi', 'Field', 'KeyField', .F.)
DBSetProp('DEPARTMANVIEW.departman_adi', 'Field', 'Updatable', .T.)
DBSetProp('DEPARTMANVIEW.departman_adi', 'Field', 'UpdateName', 'dbo.Departman.Departman_Adi')
DBSetProp('DEPARTMANVIEW.departman_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DEPARTMANVIEW.departman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFECDESCRIPT","Departman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFECFRMCAPTN","Departman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFECDLGCAPTN","Departman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFECGRDCAPTN","Departman Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFECRPTCAPTN","Departman Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFEMTOOLTIP","Departman Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFEMSTATUSTXT","Departman Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the DEPARTMANVIEW.departman_tanimi field.
DBSetProp('DEPARTMANVIEW.departman_tanimi', 'Field', 'KeyField', .F.)
DBSetProp('DEPARTMANVIEW.departman_tanimi', 'Field', 'Updatable', .T.)
DBSetProp('DEPARTMANVIEW.departman_tanimi', 'Field', 'UpdateName', 'dbo.Departman.Departman_Tanimi')
DBSetProp('DEPARTMANVIEW.departman_tanimi', 'Field', 'DataType', "C(100)")
*** DBCX Field Properties for DEPARTMANVIEW.departman_tanimi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFECDESCRIPT","Departman Tanimi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFECFRMCAPTN","Departman Tanýmý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFECDLGCAPTN","Departman Tanýmý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFECGRDCAPTN","Departman Tanýmý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFECRPTCAPTN","Departman Tanýmý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFEMTOOLTIP","Departman Tanýmý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFEMSTATUSTXT","Departman Tanýmý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DEPARTMANVIEW.departman_tanimi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
