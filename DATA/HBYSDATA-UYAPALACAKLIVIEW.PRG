***************** Begin View Definition UYAPALACAKLIVIEW ***************


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



CREATE SQL VIEW "UYAPALACAKLIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT CAST('taraf_3' as Char(10)) as taraf_Id,;
	   Alacakli.Muvekkil_Adi As Ad,;
	   CAST('kisiKurumBilgileri_3' as char(25)) as KisiKurumBilgileri_Id;
	FROM dbo.Alacakli Alacakli;
		INNER JOIN dbo.Muvekkil Muvekkil;
			ON Alacakli.Muvekkil_Id = Muvekkil.Muvekkil_Id

DBSetProp('UYAPALACAKLIVIEW', 'View', 'UpdateType', 1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'WhereType', 3)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'Tables', 'dbo.Alacakli')
DBSetProp('UYAPALACAKLIVIEW', 'View', 'Prepared', .F.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'FetchSize', 100)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'Comment', "")
DBSetProp('UYAPALACAKLIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPALACAKLIVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPALACAKLIVIEW
	GoExplorer.odbcx.Validate("UYAPALACAKLIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW","VIEW",;
		"VFECDESCRIPT","Uyapalacakliview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKLIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for UYAPALACAKLIVIEW
*** Props for the UYAPALACAKLIVIEW.muvekkil_adi field.
*** DBCX Field Properties for UYAPALACAKLIVIEW.muvekkil_adi
IF lWriteDBCXProps
ENDIF
 
