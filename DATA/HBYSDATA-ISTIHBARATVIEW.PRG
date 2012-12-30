***************** Begin View Definition ISTIHBARATVIEW ***************


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



CREATE SQL VIEW "ISTIHBARATVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Rehber.Rehber_Id,;
		Rehber.TcKimlik_No,;
		Rehber.Adi,;
		Rehber.Notlar;
	FROM dbo.Rehber Rehber

DBSetProp('ISTIHBARATVIEW', 'View', 'UpdateType', 1)
DBSetProp('ISTIHBARATVIEW', 'View', 'WhereType', 3)
DBSetProp('ISTIHBARATVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ISTIHBARATVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ISTIHBARATVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ISTIHBARATVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ISTIHBARATVIEW', 'View', 'Tables', 'dbo.Rehber')
DBSetProp('ISTIHBARATVIEW', 'View', 'Prepared', .F.)
DBSetProp('ISTIHBARATVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ISTIHBARATVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ISTIHBARATVIEW', 'View', 'FetchSize', -1)
DBSetProp('ISTIHBARATVIEW', 'View', 'ParameterList', "vp_Rehber_Id,'C'")
DBSetProp('ISTIHBARATVIEW', 'View', 'Comment', "")
DBSetProp('ISTIHBARATVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ISTIHBARATVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ISTIHBARATVIEW
	GoExplorer.odbcx.Validate("ISTIHBARATVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW","VIEW",;
		"VFECDESCRIPT","Istihbaratview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Rehber_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Rehber Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.vp_Rehber_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ISTIHBARATVIEW
*** Props for the ISTIHBARATVIEW.rehber_id field.
DBSetProp('ISTIHBARATVIEW.rehber_id', 'Field', 'KeyField', .T.)
DBSetProp('ISTIHBARATVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('ISTIHBARATVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Rehber.Rehber_Id')
DBSetProp('ISTIHBARATVIEW.rehber_id', 'Field', 'DataType', "C(36)")
DBSetProp('ISTIHBARATVIEW.rehber_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ISTIHBARATVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ISTIHBARATVIEW.tckimlik_no field.
DBSetProp('ISTIHBARATVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('ISTIHBARATVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('ISTIHBARATVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Rehber.TcKimlik_No')
DBSetProp('ISTIHBARATVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ISTIHBARATVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ISTIHBARATVIEW.adi field.
DBSetProp('ISTIHBARATVIEW.adi', 'Field', 'KeyField', .F.)
DBSetProp('ISTIHBARATVIEW.adi', 'Field', 'Updatable', .T.)
DBSetProp('ISTIHBARATVIEW.adi', 'Field', 'UpdateName', 'dbo.Rehber.Adi')
DBSetProp('ISTIHBARATVIEW.adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ISTIHBARATVIEW.adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFECDESCRIPT","Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFECFRMCAPTN","Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFECDLGCAPTN","Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFECGRDCAPTN","Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFECRPTCAPTN","Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFEMTOOLTIP","Adý                                                  ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFEMSTATUSTXT","Adý                                                  ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the ISTIHBARATVIEW.notlar field.
DBSetProp('ISTIHBARATVIEW.notlar', 'Field', 'KeyField', .F.)
DBSetProp('ISTIHBARATVIEW.notlar', 'Field', 'Updatable', .T.)
DBSetProp('ISTIHBARATVIEW.notlar', 'Field', 'UpdateName', 'dbo.Rehber.Notlar')
DBSetProp('ISTIHBARATVIEW.notlar', 'Field', 'DataType', "M")
*** DBCX Field Properties for ISTIHBARATVIEW.notlar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFECDESCRIPT","Notlar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFECFRMCAPTN","Ýstihbari Notlar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFECDLGCAPTN","Ýstihbari Notlar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFECGRDCAPTN","Ýstihbari Notlar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFECRPTCAPTN","Ýstihbari Notlar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFEMTOOLTIP","Ýstihbari Notlar                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFEMSTATUSTXT","Ýstihbari Notlar                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ISTIHBARATVIEW.notlar","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
