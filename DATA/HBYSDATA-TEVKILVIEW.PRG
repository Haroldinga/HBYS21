***************** Begin View Definition TEVKILVIEW ***************


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



CREATE SQL VIEW "TEVKILVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Tevkil.Tevkil_Id,;
		Tevkil.Tevkil_Fk,;
		Tevkil.Personel_Id,;
		Tevkil.Avukat_Adi,;
		Tevkil.Baro_Sicil_No,;
		Tevkil.Borclu_Vekili;
	FROM dbo.Tevkil Tevkil

DBSetProp('TEVKILVIEW', 'View', 'UpdateType', 1)
DBSetProp('TEVKILVIEW', 'View', 'WhereType', 3)
DBSetProp('TEVKILVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TEVKILVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('TEVKILVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TEVKILVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TEVKILVIEW', 'View', 'Tables', 'dbo.Tevkil')
DBSetProp('TEVKILVIEW', 'View', 'Prepared', .F.)
DBSetProp('TEVKILVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TEVKILVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TEVKILVIEW', 'View', 'FetchSize', -1)
DBSetProp('TEVKILVIEW', 'View', 'ParameterList', "vp_Tevkil_Fk,'C'")
DBSetProp('TEVKILVIEW', 'View', 'Comment', "")
DBSetProp('TEVKILVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TEVKILVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TEVKILVIEW
	GoExplorer.odbcx.Validate("TEVKILVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW","VIEW",;
		"VFECDESCRIPT","Tevkilview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Tevkil_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Tevkil Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFECFRMCAPTN","Tevkil FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFECDLGCAPTN","Tevkil FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFEMTOOLTIP","Tevkil FK                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Tevkil FK                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFECCLASS","idynamicviewparameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.vp_Tevkil_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for TEVKILVIEW
*** Props for the TEVKILVIEW.tevkil_id field.
DBSetProp('TEVKILVIEW.tevkil_id', 'Field', 'KeyField', .T.)
DBSetProp('TEVKILVIEW.tevkil_id', 'Field', 'Updatable', .T.)
DBSetProp('TEVKILVIEW.tevkil_id', 'Field', 'UpdateName', 'dbo.Tevkil.Tevkil_Id')
DBSetProp('TEVKILVIEW.tevkil_id', 'Field', 'DataType', "C(36)")
DBSetProp('TEVKILVIEW.tevkil_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TEVKILVIEW.tevkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFECDESCRIPT","Tevkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFECFRMCAPTN","Tevkil ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFECDLGCAPTN","Tevkil ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFECGRDCAPTN","Tevkil ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFECRPTCAPTN","Tevkil ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFEMTOOLTIP","Tevkil ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFEMSTATUSTXT","Tevkil ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TEVKILVIEW.tevkil_fk field.
DBSetProp('TEVKILVIEW.tevkil_fk', 'Field', 'KeyField', .F.)
DBSetProp('TEVKILVIEW.tevkil_fk', 'Field', 'Updatable', .T.)
DBSetProp('TEVKILVIEW.tevkil_fk', 'Field', 'UpdateName', 'dbo.Tevkil.Tevkil_Fk')
DBSetProp('TEVKILVIEW.tevkil_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TEVKILVIEW.tevkil_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFECDESCRIPT","Tevkil Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFECFRMCAPTN","Tevkil FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFECDLGCAPTN","Tevkil FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFECGRDCAPTN","Tevkil FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFECRPTCAPTN","Tevkil FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFEMTOOLTIP","Tevkil FK                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFEMSTATUSTXT","Tevkil FK                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.tevkil_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TEVKILVIEW.personel_id field.
DBSetProp('TEVKILVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('TEVKILVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('TEVKILVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Tevkil.Personel_Id')
DBSetProp('TEVKILVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TEVKILVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.personel_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TEVKILVIEW.avukat_adi field.
DBSetProp('TEVKILVIEW.avukat_adi', 'Field', 'KeyField', .F.)
DBSetProp('TEVKILVIEW.avukat_adi', 'Field', 'Updatable', .T.)
DBSetProp('TEVKILVIEW.avukat_adi', 'Field', 'UpdateName', 'dbo.Tevkil.Avukat_Adi')
DBSetProp('TEVKILVIEW.avukat_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TEVKILVIEW.avukat_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECDESCRIPT","Avukat Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECFRMCAPTN","Avukat Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECDLGCAPTN","Avukat Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECGRDCAPTN","Avukat Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECRPTCAPTN","Avukat Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFEMTOOLTIP","Avukat Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFEMSTATUSTXT","Avukat Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECLUTABLE","hbysdata!avukatlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECLUTAG","personel_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFEMLUFIELDS","personel_adi, baro_sicil_no") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFEMLUUPDTEXP","Avukatlookupview.personel_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.avukat_adi","FIELD",;
		"VFEMLUUPDFLDS","baro_sicil_no, personel_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the TEVKILVIEW.baro_sicil_no field.
DBSetProp('TEVKILVIEW.baro_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('TEVKILVIEW.baro_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('TEVKILVIEW.baro_sicil_no', 'Field', 'UpdateName', 'dbo.Tevkil.Baro_Sicil_No')
DBSetProp('TEVKILVIEW.baro_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TEVKILVIEW.baro_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFECDESCRIPT","Baro Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFECFRMCAPTN","Baro Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFECDLGCAPTN","Baro Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFECGRDCAPTN","Baro Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFECRPTCAPTN","Baro Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFEMTOOLTIP","Baro Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Baro Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.baro_sicil_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TEVKILVIEW.borclu_vekili field.
DBSetProp('TEVKILVIEW.borclu_vekili', 'Field', 'KeyField', .F.)
DBSetProp('TEVKILVIEW.borclu_vekili', 'Field', 'Updatable', .T.)
DBSetProp('TEVKILVIEW.borclu_vekili', 'Field', 'UpdateName', 'dbo.Tevkil.Borclu_Vekili')
DBSetProp('TEVKILVIEW.borclu_vekili', 'Field', 'DataType', "L")
*** DBCX Field Properties for TEVKILVIEW.borclu_vekili
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFECDESCRIPT","Borclu Vekili Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFECFRMCAPTN","Borçlu Vekili") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFECDLGCAPTN","Borçlu Vekili") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFECGRDCAPTN","Borçlu Vekili") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFECRPTCAPTN","Borçlu Vekili") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFEMTOOLTIP","Borçlu Vekili                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFEMSTATUSTXT","Borçlu Vekili                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TEVKILVIEW.borclu_vekili","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
