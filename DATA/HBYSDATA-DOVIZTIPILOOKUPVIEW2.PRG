***************** Begin View Definition DOVIZTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "DOVIZTIPILOOKUPVIEW" ; 
	AS SELECT Doviztipi.doviz_tipi,;
		Doviztipi.aciklama;
	FROM hbysreferans!doviztipi;
	WHERE Doviztipi.doviz_tipi IS NOT NULL AND;
		NOT (EMPTY(Doviztipi.doviz_tipi) )

DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'Tables', 'hbysreferans!doviztipi')
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'FetchSize', 100)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOVIZTIPILOOKUPVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOVIZTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("DOVIZTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","DOVIZTIPILOOKUPVIEW Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DOVIZTIPILOOKUPVIEW
*** Props for the DOVIZTIPILOOKUPVIEW.doviz_tipi field.
DBSetProp('DOVIZTIPILOOKUPVIEW.doviz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW.doviz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOVIZTIPILOOKUPVIEW.doviz_tipi', 'Field', 'UpdateName', 'hbysreferans!doviztipi.doviz_tipi')
DBSetProp('DOVIZTIPILOOKUPVIEW.doviz_tipi', 'Field', 'DataType', "C(3)")

*** DBCX Field Properties for DOVIZTIPILOOKUPVIEW.doviz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFECDESCRIPT","Doviz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFECFRMCAPTN","Döviz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFECDLGCAPTN","Döviz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFECGRDCAPTN","Döviz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFECRPTCAPTN","Döviz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFEMTOOLTIP","Döviz Tipi                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFEMSTATUSTXT","Döviz Tipi                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.doviz_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DOVIZTIPILOOKUPVIEW.aciklama field.
DBSetProp('DOVIZTIPILOOKUPVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('DOVIZTIPILOOKUPVIEW.aciklama', 'Field', 'UpdateName', 'dbo.DovizTipi.Aciklama')
DBSetProp('DOVIZTIPILOOKUPVIEW.aciklama', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOVIZTIPILOOKUPVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Aciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Aciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Aciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Aciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Aciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Aciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW.aciklama","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
