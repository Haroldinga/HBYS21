***************** Begin View Definition UYAPBORCLUVIEW ***************


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



CREATE SQL VIEW "UYAPBORCLUVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT CAST('taraf_5' as char(10)) As Taraf_Id,;
	CAST('kisiKurumBilgileri_5' as char(25)) as KýsýKurumBilgileri_Id,;
	Borclu.Borclu_Adi As Ad,;
	Borclu.TcKimlik_No;
	FROM {oj{oj dbo.Borclu Borclu;
		INNER JOIN dbo.Rehber Rehber;
			ON Borclu.Rehber_Id = Rehber.Rehber_Id;
		LEFT OUTER JOIN dbo.Iletisim Iletisim;
			ON Rehber.Rehber_Id = Iletisim.Iletisim_Fk};
		LEFT OUTER JOIN dbo.Adres Adres;
			ON Rehber.Rehber_Id = Adres.Adres_Fk}

DBSetProp('UYAPBORCLUVIEW', 'View', 'UpdateType', 1)
DBSetProp('UYAPBORCLUVIEW', 'View', 'WhereType', 3)
DBSetProp('UYAPBORCLUVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPBORCLUVIEW', 'View', 'MaxRecords', -1)
DBSetProp('UYAPBORCLUVIEW', 'View', 'Tables', 'dbo.Borclu')
DBSetProp('UYAPBORCLUVIEW', 'View', 'Prepared', .F.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPBORCLUVIEW', 'View', 'FetchSize', 100)
DBSetProp('UYAPBORCLUVIEW', 'View', 'Comment', "")
DBSetProp('UYAPBORCLUVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPBORCLUVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPBORCLUVIEW
	GoExplorer.odbcx.Validate("UYAPBORCLUVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW","VIEW",;
		"VFECDESCRIPT","Uyapborcluview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for UYAPBORCLUVIEW
*** Props for the UYAPBORCLUVIEW.tckimlik_no field.
DBSetProp('UYAPBORCLUVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('UYAPBORCLUVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('UYAPBORCLUVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('UYAPBORCLUVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPBORCLUVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPBORCLUVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
