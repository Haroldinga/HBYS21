***************** Begin View Definition ALACAKLIVIEW ***************


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



CREATE SQL VIEW "ALACAKLIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Alacakli.Alacakli_Id,;
		Alacakli.Alacakli_Fk,;
		Alacakli.Muvekkil_Id,;
		Alacakli.TcKimlik_No,;
		Alacakli.Ticaret_Sicil_No,;
		Alacakli.Muvekkil_Adi,;
		Alacakli.Sube_Id,;
		Alacakli.Sube_Adi;
	FROM dbo.Alacakli Alacakli

DBSetProp('ALACAKLIVIEW', 'View', 'UpdateType', 1)
DBSetProp('ALACAKLIVIEW', 'View', 'WhereType', 3)
DBSetProp('ALACAKLIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('ALACAKLIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('ALACAKLIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('ALACAKLIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('ALACAKLIVIEW', 'View', 'Tables', 'dbo.Alacakli')
DBSetProp('ALACAKLIVIEW', 'View', 'Prepared', .F.)
DBSetProp('ALACAKLIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('ALACAKLIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ALACAKLIVIEW', 'View', 'FetchSize', -1)
DBSetProp('ALACAKLIVIEW', 'View', 'ParameterList', "vp_Alacakli_Fk,'C'")
DBSetProp('ALACAKLIVIEW', 'View', 'Comment', "")
DBSetProp('ALACAKLIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('ALACAKLIVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ALACAKLIVIEW
	GoExplorer.odbcx.Validate("ALACAKLIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW","VIEW",;
		"VFECDESCRIPT","Alacakliview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Alacakli_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Alacakli Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFECFRMCAPTN","Alacaklý FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFECDLGCAPTN","Alacaklý FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFEMTOOLTIP","Alacaklý FK                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Alacaklý FK                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.vp_Alacakli_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for ALACAKLIVIEW
*** Props for the ALACAKLIVIEW.alacakli_id field.
DBSetProp('ALACAKLIVIEW.alacakli_id', 'Field', 'KeyField', .T.)
DBSetProp('ALACAKLIVIEW.alacakli_id', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKLIVIEW.alacakli_id', 'Field', 'UpdateName', 'dbo.Alacakli.Alacakli_Id')
DBSetProp('ALACAKLIVIEW.alacakli_id', 'Field', 'DataType', "C(36)")
DBSetProp('ALACAKLIVIEW.alacakli_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for ALACAKLIVIEW.alacakli_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFECDESCRIPT","Alacakli Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFECFRMCAPTN","Alacaklý ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFECDLGCAPTN","Alacaklý ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFECGRDCAPTN","Alacaklý ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFECRPTCAPTN","Alacaklý ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFEMTOOLTIP","Alacaklý ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFEMSTATUSTXT","Alacaklý ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the ALACAKLIVIEW.alacakli_fk field.
DBSetProp('ALACAKLIVIEW.alacakli_fk', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKLIVIEW.alacakli_fk', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKLIVIEW.alacakli_fk', 'Field', 'UpdateName', 'dbo.Alacakli.Alacakli_Fk')
DBSetProp('ALACAKLIVIEW.alacakli_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ALACAKLIVIEW.alacakli_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFECDESCRIPT","Alacakli Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFECFRMCAPTN","Alacaklý FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFECDLGCAPTN","Alacaklý FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFECGRDCAPTN","Alacaklý FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFECRPTCAPTN","Alacaklý FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFEMTOOLTIP","Alacaklý FK                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFEMSTATUSTXT","Alacaklý FK                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.alacakli_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the ALACAKLIVIEW.muvekkil_id field.
DBSetProp('ALACAKLIVIEW.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKLIVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKLIVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.Alacakli.Muvekkil_Id')
DBSetProp('ALACAKLIVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ALACAKLIVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Müvekkil ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Müvekkil ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Müvekkil ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Müvekkil ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Müvekkil ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Müvekkil ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECLUTAG","muvekkil_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFEMLUFIELDS","muvekkil_adi, tckimlik_no, ticaret_sicil_no") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_id","FIELD",;
		"VFEMLUUPDFLDS","muvekkil_adi, tckimlik_no, ticaret_sicil_no") &&After Lookup Update Field List
ENDIF
 
*** Props for the ALACAKLIVIEW.tckimlik_no field.
DBSetProp('ALACAKLIVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKLIVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKLIVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Alacakli.TcKimlik_No')
DBSetProp('ALACAKLIVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ALACAKLIVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tc Kimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tc Kimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tc Kimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tc Kimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tc Kimlik No                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tc Kimlik No                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the ALACAKLIVIEW.ticaret_sicil_no field.
DBSetProp('ALACAKLIVIEW.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKLIVIEW.ticaret_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKLIVIEW.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Alacakli.Ticaret_Sicil_No')
DBSetProp('ALACAKLIVIEW.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for ALACAKLIVIEW.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Ticaret Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Ticaret Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Ticaret Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Ticaret Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the ALACAKLIVIEW.muvekkil_adi field.
DBSetProp('ALACAKLIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKLIVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKLIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Alacakli.Muvekkil_Adi')
DBSetProp('ALACAKLIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ALACAKLIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the ALACAKLIVIEW.sube_id field.
DBSetProp('ALACAKLIVIEW.sube_id', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKLIVIEW.sube_id', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKLIVIEW.sube_id', 'Field', 'UpdateName', 'dbo.Alacakli.Sube_Id')
DBSetProp('ALACAKLIVIEW.sube_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for ALACAKLIVIEW.sube_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECDESCRIPT","Sube Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECGRDCAPTN","Þube Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECRPTCAPTN","Þube Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECLUTABLE","hbysdata!subelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECLUTAG","sube_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFEMLUFIELDS","sube_adi, sube_kodu, muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFEMLUUPDTEXP","Subelookupview.sube_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_id","FIELD",;
		"VFEMLUUPDFLDS","sube_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the ALACAKLIVIEW.sube_adi field.
DBSetProp('ALACAKLIVIEW.sube_adi', 'Field', 'KeyField', .F.)
DBSetProp('ALACAKLIVIEW.sube_adi', 'Field', 'Updatable', .T.)
DBSetProp('ALACAKLIVIEW.sube_adi', 'Field', 'UpdateName', 'dbo.Alacakli.Sube_Adi')
DBSetProp('ALACAKLIVIEW.sube_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ALACAKLIVIEW.sube_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFECDESCRIPT","Sube Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFECGRDCAPTN","Þube Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFECRPTCAPTN","Þube Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ALACAKLIVIEW.sube_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
