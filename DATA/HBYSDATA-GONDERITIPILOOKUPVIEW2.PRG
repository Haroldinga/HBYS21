***************** Begin View Definition GONDERITIPILOOKUPVIEW1 ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREFERANS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\hbysreferans"
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



CREATE SQL VIEW "GONDERITIPILOOKUPVIEW1" ; 
	AS SELECT Gonderitipi.gonderi_tipi,;
		Gonderitipi.gonderi_kodu;
	FROM hbysreferans!gonderitipi

DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!gonderitipi')
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('GONDERITIPILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for GONDERITIPILOOKUPVIEW1
	GoExplorer.odbcx.Validate("GONDERITIPILOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Gonderitipilookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for GONDERITIPILOOKUPVIEW1
*** Props for the GONDERITIPILOOKUPVIEW1.gonderi_tipi field.
DBSetProp('GONDERITIPILOOKUPVIEW1.gonderi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW1.gonderi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERITIPILOOKUPVIEW1.gonderi_tipi', 'Field', 'UpdateName', 'hbysreferans!gonderitipi.gonderi_tipi')
DBSetProp('GONDERITIPILOOKUPVIEW1.gonderi_tipi', 'Field', 'DataType', "C(15)")


*** DBCX Field Properties for GONDERITIPILOOKUPVIEW.gonderi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECDESCRIPT","Gonderi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECFRMCAPTN","Gonderi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECDLGCAPTN","Gonderi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECGRDCAPTN","Gonderi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECRPTCAPTN","Gonderi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFEMTOOLTIP","Gonderi Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gonderi Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*** Props for the GONDERITIPILOOKUPVIEW1.gonderi_kodu field.
DBSetProp('GONDERITIPILOOKUPVIEW1.gonderi_kodu', 'Field', 'KeyField', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW1.gonderi_kodu', 'Field', 'Updatable', .T.)
DBSetProp('GONDERITIPILOOKUPVIEW1.gonderi_kodu', 'Field', 'UpdateName', 'hbysreferans!gonderitipi.gonderi_kodu')
DBSetProp('GONDERITIPILOOKUPVIEW1.gonderi_kodu', 'Field', 'DataType', "C(2)")

*** DBCX Field Properties for GONDERITIPILOOKUPVIEW.gonderi_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECDESCRIPT","Gonderi Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECFRMCAPTN","Gonderi Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECDLGCAPTN","Gonderi Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECGRDCAPTN","Gonderi Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECRPTCAPTN","Gonderi Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFEMTOOLTIP","Gonderi Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFEMSTATUSTXT","Gonderi Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
