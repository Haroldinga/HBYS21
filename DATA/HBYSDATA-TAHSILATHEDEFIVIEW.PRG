***************** Begin View Definition TAHSILATHEDEFIVIEW ***************


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



CREATE SQL VIEW "TAHSILATHEDEFIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Tahsilathedefi.TahsilatHedefi_Id,;
		Tahsilathedefi.TahsilatHedefi_Fk,;
		Tahsilathedefi.Departman_Adi,;
		Tahsilathedefi.Personel_Adi,;
		Tahsilathedefi.Muvekkil_Id,;
		Tahsilathedefi.Muvekkil_Adi,;
		Tahsilathedefi.Borc_Tipi,;
		Tahsilathedefi.Tahsilat_Yili,;
		Tahsilathedefi.Tahsilat_Ayi,;
		Tahsilathedefi.Tahsilat_Hedefi,;
		Tahsilathedefi.Tahsilat_Miktari,;
		Tahsilathedefi.Prim_Hesabi;
	FROM dbo.TahsilatHedefi Tahsilathedefi

DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'UpdateType', 1)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'WhereType', 3)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'Tables', 'dbo.TahsilatHedefi')
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'Prepared', .F.)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'FetchSize', -1)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'ParameterList', "vp_TahsilatHedefi_Fk,'C'")
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'Comment', "")
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAHSILATHEDEFIVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TAHSILATHEDEFIVIEW
	GoExplorer.odbcx.Validate("TAHSILATHEDEFIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW","VIEW",;
		"VFECDESCRIPT","Tahsilathedefiview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_TahsilatHedefi_Fk
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFECDESCRIPT","Vp Tahsilathedefi Fk View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFECFRMCAPTN","Tahsilathedefi FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFECDLGCAPTN","Tahsilathedefi FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFEMTOOLTIP","Tahsilathedefi FK                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFEMSTATUSTXT","Tahsilathedefi FK                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.vp_TahsilatHedefi_Fk","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for TAHSILATHEDEFIVIEW
*** Props for the TAHSILATHEDEFIVIEW.tahsilathedefi_id field.
DBSetProp('TAHSILATHEDEFIVIEW.tahsilathedefi_id', 'Field', 'KeyField', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilathedefi_id', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilathedefi_id', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.TahsilatHedefi_Id')
DBSetProp('TAHSILATHEDEFIVIEW.tahsilathedefi_id', 'Field', 'DataType', "C(36)")
DBSetProp('TAHSILATHEDEFIVIEW.tahsilathedefi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.tahsilathedefi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFECDESCRIPT","Tahsilathedefi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFECFRMCAPTN","Tahsilathedefi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFECDLGCAPTN","Tahsilathedefi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFECGRDCAPTN","Tahsilathedefi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFECRPTCAPTN","Tahsilathedefi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFEMTOOLTIP","Tahsilathedefi ID                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFEMSTATUSTXT","Tahsilathedefi ID                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.tahsilathedefi_fk field.
DBSetProp('TAHSILATHEDEFIVIEW.tahsilathedefi_fk', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilathedefi_fk', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilathedefi_fk', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.TahsilatHedefi_Fk')
DBSetProp('TAHSILATHEDEFIVIEW.tahsilathedefi_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.tahsilathedefi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFECDESCRIPT","Tahsilathedefi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFECFRMCAPTN","Tahsilathedefi FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFECDLGCAPTN","Tahsilathedefi FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFECGRDCAPTN","Tahsilathedefi FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFECRPTCAPTN","Tahsilathedefi FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFEMTOOLTIP","Tahsilathedefi FK                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFEMSTATUSTXT","Tahsilathedefi FK                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilathedefi_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.departman_adi field.
DBSetProp('TAHSILATHEDEFIVIEW.departman_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.departman_adi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.departman_adi', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Departman_Adi')
DBSetProp('TAHSILATHEDEFIVIEW.departman_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.departman_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFECDESCRIPT","Departman Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFECFRMCAPTN","Departman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFECDLGCAPTN","Departman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFECGRDCAPTN","Departman Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFECRPTCAPTN","Departman Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFEMTOOLTIP","Departman Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFEMSTATUSTXT","Departman Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.departman_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.personel_adi field.
DBSetProp('TAHSILATHEDEFIVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Personel_Adi')
DBSetProp('TAHSILATHEDEFIVIEW.personel_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.muvekkil_id field.
DBSetProp('TAHSILATHEDEFIVIEW.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Muvekkil_Id')
DBSetProp('TAHSILATHEDEFIVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECLUTAG","muvekkil_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_id","FIELD",;
		"VFEMLUUPDFLDS","muvekkil_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.muvekkil_adi field.
DBSetProp('TAHSILATHEDEFIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Muvekkil_Adi')
DBSetProp('TAHSILATHEDEFIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.borc_tipi field.
DBSetProp('TAHSILATHEDEFIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Borc_Tipi')
DBSetProp('TAHSILATHEDEFIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.tahsilat_yili field.
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_yili', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_yili', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_yili', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Tahsilat_Yili')
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_yili', 'Field', 'DataType', "I")
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_yili', 'Field', 'DefaultValue', "year(date())")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.tahsilat_yili
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFECDESCRIPT","Tahsilat Yili Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFECFRMCAPTN","Tahsilat Yýlý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFECDLGCAPTN","Tahsilat Yýlý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFECGRDCAPTN","Tahsilat Yýlý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFECRPTCAPTN","Tahsilat Yýlý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFEMTOOLTIP","Tahsilat Yýlý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Yýlý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_yili","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.tahsilat_ayi field.
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_ayi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_ayi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_ayi', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Tahsilat_Ayi')
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_ayi', 'Field', 'DataType', "I")
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_ayi', 'Field', 'DefaultValue', "month(date())")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.tahsilat_ayi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFECDESCRIPT","Tahsilat Ayi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Ayý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Ayý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Ayý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Ayý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Ayý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Ayý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_ayi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.tahsilat_hedefi field.
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_hedefi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_hedefi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_hedefi', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Tahsilat_Hedefi')
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_hedefi', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.tahsilat_hedefi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFECDESCRIPT","Tahsilat Hedefi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Hedefi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Hedefi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Hedefi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Hedefi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Hedefi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Hedefi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_hedefi","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.tahsilat_miktari field.
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_miktari', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Tahsilat_Miktari')
DBSetProp('TAHSILATHEDEFIVIEW.tahsilat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.tahsilat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFECDESCRIPT","Tahsilat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFECFRMCAPTN","Tahsilat Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFECDLGCAPTN","Tahsilat Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFECGRDCAPTN","Tahsilat Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFECRPTCAPTN","Tahsilat Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFEMTOOLTIP","Tahsilat Miktarý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Miktarý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.tahsilat_miktari","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the TAHSILATHEDEFIVIEW.prim_hesabi field.
DBSetProp('TAHSILATHEDEFIVIEW.prim_hesabi', 'Field', 'KeyField', .F.)
DBSetProp('TAHSILATHEDEFIVIEW.prim_hesabi', 'Field', 'Updatable', .T.)
DBSetProp('TAHSILATHEDEFIVIEW.prim_hesabi', 'Field', 'UpdateName', 'dbo.TahsilatHedefi.Prim_Hesabi')
DBSetProp('TAHSILATHEDEFIVIEW.prim_hesabi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TAHSILATHEDEFIVIEW.prim_hesabi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFECDESCRIPT","Prim Hesabi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFECFRMCAPTN","Prim Hesabý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFECDLGCAPTN","Prim Hesabý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFECGRDCAPTN","Prim Hesabý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFECRPTCAPTN","Prim Hesabý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFEMTOOLTIP","Prim Hesabý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFEMSTATUSTXT","Prim Hesabý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAHSILATHEDEFIVIEW.prim_hesabi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
