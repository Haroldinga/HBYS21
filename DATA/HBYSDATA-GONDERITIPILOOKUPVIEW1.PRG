***************** Begin View Definition GONDERITIPILOOKUPVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREFERANS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\hbysreferans"
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



CREATE SQL VIEW "GONDERITIPILOOKUPVIEW" ; 
	AS SELECT Gonderitipi.gonderi_tipi,;
		Gonderitipi.gonderi_kodu;
	FROM hbysreferans!gonderitipi

DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!gonderitipi')
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('GONDERITIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for GONDERITIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("GONDERITIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","GONDERITIPILOOKUPVIEW Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for GONDERITIPILOOKUPVIEW
*** Props for the GONDERITIPILOOKUPVIEW.gonderi_tipi field.
DBSetProp('GONDERITIPILOOKUPVIEW.gonderi_tipi', 'Field', 'KeyField', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW.gonderi_tipi', 'Field', 'Updatable', .T.)
DBSetProp('GONDERITIPILOOKUPVIEW.gonderi_tipi', 'Field', 'UpdateName', 'hbysreferans!gonderitipi.gonderi_tipi')
DBSetProp('GONDERITIPILOOKUPVIEW.gonderi_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for GONDERITIPILOOKUPVIEW.gonderi_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECDESCRIPT","Gonderi Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECFRMCAPTN","Gönderi Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECDLGCAPTN","Gönderi Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECGRDCAPTN","Gönderi Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFECRPTCAPTN","Gönderi Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFEMTOOLTIP","Gönderi Tipi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_tipi","FIELD",;
		"VFEMSTATUSTXT","Gönderi Tipi                                         ") &&Status Bar Text
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
 
*** Props for the GONDERITIPILOOKUPVIEW.gonderi_kodu field.
DBSetProp('GONDERITIPILOOKUPVIEW.gonderi_kodu', 'Field', 'KeyField', .F.)
DBSetProp('GONDERITIPILOOKUPVIEW.gonderi_kodu', 'Field', 'Updatable', .T.)
DBSetProp('GONDERITIPILOOKUPVIEW.gonderi_kodu', 'Field', 'UpdateName', 'hbysreferans!gonderitipi.gonderi_kodu')
DBSetProp('GONDERITIPILOOKUPVIEW.gonderi_kodu', 'Field', 'DataType', "C(2)")
*** DBCX Field Properties for GONDERITIPILOOKUPVIEW.gonderi_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECDESCRIPT","Gonderi Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECFRMCAPTN","Gönderi Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECDLGCAPTN","Gönderi Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECGRDCAPTN","Gönderi Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFECRPTCAPTN","Gönderi Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFEMTOOLTIP","Gönderi Kodu                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!GONDERITIPILOOKUPVIEW.gonderi_kodu","FIELD",;
		"VFEMSTATUSTXT","Gönderi Kodu                                         ") &&Status Bar Text
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
 
