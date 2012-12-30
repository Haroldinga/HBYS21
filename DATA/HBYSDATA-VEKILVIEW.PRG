***************** Begin View Definition VEKILVIEW ***************


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



CREATE SQL VIEW "VEKILVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Vekil.Vekil_Id,;
		Vekil.Vekil_Fk,;
		Vekil.Personel_Id,;
		Vekil.Avukat_Adi,;
		Vekil.Baro_Sicil_No;
	FROM dbo.Vekil Vekil

DBSetProp('VEKILVIEW', 'View', 'UpdateType', 1)
DBSetProp('VEKILVIEW', 'View', 'WhereType', 3)
DBSetProp('VEKILVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('VEKILVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('VEKILVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('VEKILVIEW', 'View', 'MaxRecords', -1)
DBSetProp('VEKILVIEW', 'View', 'Tables', 'dbo.Vekil')
DBSetProp('VEKILVIEW', 'View', 'Prepared', .F.)
DBSetProp('VEKILVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('VEKILVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('VEKILVIEW', 'View', 'FetchSize', -1)
DBSetProp('VEKILVIEW', 'View', 'ParameterList', "vp_Vekil_Fk,'C'")
DBSetProp('VEKILVIEW', 'View', 'Comment', "")
DBSetProp('VEKILVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('VEKILVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for VEKILVIEW
	GoExplorer.odbcx.Validate("VEKILVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW","VIEW",;
		"VFECDESCRIPT","Vekilview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Vekil_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Vekil Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECFRMCAPTN","Vekil FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECDLGCAPTN","Vekil FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMTOOLTIP","Vekil FK                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Vekil FK                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECCLASS","idynamicviewparameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vp_Vekil_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for VEKILVIEW
*** Props for the VEKILVIEW.vekil_id field.
DBSetProp('VEKILVIEW.vekil_id', 'Field', 'KeyField', .T.)
DBSetProp('VEKILVIEW.vekil_id', 'Field', 'Updatable', .T.)
DBSetProp('VEKILVIEW.vekil_id', 'Field', 'UpdateName', 'dbo.Vekil.Vekil_Id')
DBSetProp('VEKILVIEW.vekil_id', 'Field', 'DataType', "C(36)")
DBSetProp('VEKILVIEW.vekil_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for VEKILVIEW.vekil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFECDESCRIPT","Vekil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFECFRMCAPTN","Vekil ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFECDLGCAPTN","Vekil ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFECGRDCAPTN","Vekil ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFECRPTCAPTN","Vekil ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFEMTOOLTIP","Vekil ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFEMSTATUSTXT","Vekil ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the VEKILVIEW.vekil_fk field.
DBSetProp('VEKILVIEW.vekil_fk', 'Field', 'KeyField', .F.)
DBSetProp('VEKILVIEW.vekil_fk', 'Field', 'Updatable', .T.)
DBSetProp('VEKILVIEW.vekil_fk', 'Field', 'UpdateName', 'dbo.Vekil.Vekil_Fk')
DBSetProp('VEKILVIEW.vekil_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for VEKILVIEW.vekil_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFECDESCRIPT","Vekil Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFECFRMCAPTN","Vekil FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFECDLGCAPTN","Vekil FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFECGRDCAPTN","Vekil FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFECRPTCAPTN","Vekil FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFEMTOOLTIP","Vekil FK                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFEMSTATUSTXT","Vekil FK                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.vekil_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the VEKILVIEW.personel_id field.
DBSetProp('VEKILVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('VEKILVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('VEKILVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Vekil.Personel_Id')
DBSetProp('VEKILVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for VEKILVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel ID                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel ID                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.personel_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the VEKILVIEW.avukat_adi field.
DBSetProp('VEKILVIEW.avukat_adi', 'Field', 'KeyField', .F.)
DBSetProp('VEKILVIEW.avukat_adi', 'Field', 'Updatable', .T.)
DBSetProp('VEKILVIEW.avukat_adi', 'Field', 'UpdateName', 'dbo.Vekil.Avukat_Adi')
DBSetProp('VEKILVIEW.avukat_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for VEKILVIEW.avukat_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECDESCRIPT","Avukat Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECFRMCAPTN","Avukat Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECDLGCAPTN","Avukat Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECGRDCAPTN","Avukat Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECRPTCAPTN","Avukat Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFEMTOOLTIP","Avukat Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFEMSTATUSTXT","Avukat Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECLUTABLE","hbysdata!avukatlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECLUTAG","personel_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFEMLUFIELDS","personel_adi, baro_sicil_no") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFEMLUUPDTEXP","Avukatlookupview.personel_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.avukat_adi","FIELD",;
		"VFEMLUUPDFLDS","baro_sicil_no, personel_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the VEKILVIEW.baro_sicil_no field.
DBSetProp('VEKILVIEW.baro_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('VEKILVIEW.baro_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('VEKILVIEW.baro_sicil_no', 'Field', 'UpdateName', 'dbo.Vekil.Baro_Sicil_No')
DBSetProp('VEKILVIEW.baro_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for VEKILVIEW.baro_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFECDESCRIPT","Baro Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFECFRMCAPTN","Baro Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFECDLGCAPTN","Baro Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFECGRDCAPTN","Baro Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFECRPTCAPTN","Baro Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFEMTOOLTIP","Baro Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Baro Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!VEKILVIEW.baro_sicil_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
