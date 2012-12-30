***************** Begin View Definition PERSONELLOOKUPVIEW ***************


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



CREATE SQL VIEW "PERSONELLOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Personel.Personel_Id,;
		Personel.Personel_Adi,;
		Personel.Baro_Sicil_No;
	FROM dbo.Personel Personel

DBSetProp('PERSONELLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'Tables', 'dbo.Personel')
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('PERSONELLOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for PERSONELLOOKUPVIEW
	GoExplorer.odbcx.Validate("PERSONELLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Personellookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for PERSONELLOOKUPVIEW
*** Props for the PERSONELLOOKUPVIEW.personel_id field.
DBSetProp('PERSONELLOOKUPVIEW.personel_id', 'Field', 'KeyField', .T.)
DBSetProp('PERSONELLOOKUPVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLOOKUPVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Personel.Personel_Id')
DBSetProp('PERSONELLOOKUPVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for PERSONELLOOKUPVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the PERSONELLOOKUPVIEW.personel_adi field.
DBSetProp('PERSONELLOOKUPVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELLOOKUPVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLOOKUPVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('PERSONELLOOKUPVIEW.personel_adi', 'Field', 'Caption', "Personl Adý")
DBSetProp('PERSONELLOOKUPVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for PERSONELLOOKUPVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personl Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personl Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personl Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personl Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personl Adý") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personl Adý") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the PERSONELLOOKUPVIEW.baro_sicil_no field.
DBSetProp('PERSONELLOOKUPVIEW.baro_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('PERSONELLOOKUPVIEW.baro_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('PERSONELLOOKUPVIEW.baro_sicil_no', 'Field', 'UpdateName', 'dbo.Personel.Baro_Sicil_No')
DBSetProp('PERSONELLOOKUPVIEW.baro_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for PERSONELLOOKUPVIEW.baro_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFECDESCRIPT","Baro Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFECFRMCAPTN","Baro Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFECDLGCAPTN","Baro Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFECGRDCAPTN","Baro Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFECRPTCAPTN","Baro Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFEMTOOLTIP","Baro Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Baro Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!PERSONELLOOKUPVIEW.baro_sicil_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
