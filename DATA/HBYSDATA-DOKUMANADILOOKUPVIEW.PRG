***************** Begin View Definition DOKUMANADILOOKUPVIEW ***************


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



CREATE SQL VIEW "DOKUMANADILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Raporlistesi.RaporListesi_Id,;
		Raporlistesi.Rapor_Adi,;
		Raporlistesi.Rapor_Tipi;
	FROM dbo.RaporListesi Raporlistesi

DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'Tables', 'dbo.RaporListesi')
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOKUMANADILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOKUMANADILOOKUPVIEW
	GoExplorer.odbcx.Validate("DOKUMANADILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Dokumanadilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DOKUMANADILOOKUPVIEW
*** Props for the DOKUMANADILOOKUPVIEW.raporlistesi_id field.
DBSetProp('DOKUMANADILOOKUPVIEW.raporlistesi_id', 'Field', 'KeyField', .T.)
DBSetProp('DOKUMANADILOOKUPVIEW.raporlistesi_id', 'Field', 'Updatable', .F.)
DBSetProp('DOKUMANADILOOKUPVIEW.raporlistesi_id', 'Field', 'UpdateName', 'dbo.RaporListesi.RaporListesi_Id')
DBSetProp('DOKUMANADILOOKUPVIEW.raporlistesi_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for DOKUMANADILOOKUPVIEW.raporlistesi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFECDESCRIPT","Raporlistesi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFECFRMCAPTN","Raporlistesi Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFECDLGCAPTN","Raporlistesi Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFECGRDCAPTN","Raporlistesi Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFECRPTCAPTN","Raporlistesi Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFEMTOOLTIP","Raporlistesi Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFEMSTATUSTXT","Raporlistesi Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.raporlistesi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DOKUMANADILOOKUPVIEW.rapor_adi field.
DBSetProp('DOKUMANADILOOKUPVIEW.rapor_adi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANADILOOKUPVIEW.rapor_adi', 'Field', 'Updatable', .T.)
DBSetProp('DOKUMANADILOOKUPVIEW.rapor_adi', 'Field', 'UpdateName', 'dbo.RaporListesi.Rapor_Adi')
DBSetProp('DOKUMANADILOOKUPVIEW.rapor_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for DOKUMANADILOOKUPVIEW.rapor_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECDESCRIPT","Rapor Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECFRMCAPTN","Rapor Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECDLGCAPTN","Rapor Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECGRDCAPTN","Rapor Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECRPTCAPTN","Rapor Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMTOOLTIP","Rapor Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMSTATUSTXT","Rapor Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the DOKUMANADILOOKUPVIEW.rapor_tipi field.
DBSetProp('DOKUMANADILOOKUPVIEW.rapor_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOKUMANADILOOKUPVIEW.rapor_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOKUMANADILOOKUPVIEW.rapor_tipi', 'Field', 'UpdateName', 'dbo.RaporListesi.Rapor_Tipi')
DBSetProp('DOKUMANADILOOKUPVIEW.rapor_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DOKUMANADILOOKUPVIEW.rapor_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECDESCRIPT","Rapor Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECFRMCAPTN","Rapor Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECDLGCAPTN","Rapor Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECGRDCAPTN","Rapor Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECRPTCAPTN","Rapor Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMTOOLTIP","Rapor Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMSTATUSTXT","Rapor Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOKUMANADILOOKUPVIEW.rapor_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
