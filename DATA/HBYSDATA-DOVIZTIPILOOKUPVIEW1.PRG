***************** Begin View Definition DOVIZTIPILOOKUPVIEW1 ***************


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



CREATE SQL VIEW "DOVIZTIPILOOKUPVIEW1" ; 
	AS SELECT Doviztipi.doviz_tipi,;
		Doviztipi.aciklama;
	FROM hbysreferans!doviztipi;
	WHERE Doviztipi.doviz_tipi IS NOT NULL AND;
		NOT (EMPTY(Doviztipi.doviz_tipi) )

DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!doviztipi')
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('DOVIZTIPILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DOVIZTIPILOOKUPVIEW1
	GoExplorer.odbcx.Validate("DOVIZTIPILOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Doviztipilookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DOVIZTIPILOOKUPVIEW1
*** Props for the DOVIZTIPILOOKUPVIEW1.doviz_tipi field.
DBSetProp('DOVIZTIPILOOKUPVIEW1.doviz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW1.doviz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('DOVIZTIPILOOKUPVIEW1.doviz_tipi', 'Field', 'UpdateName', 'hbysreferans!doviztipi.doviz_tipi')
DBSetProp('DOVIZTIPILOOKUPVIEW1.doviz_tipi', 'Field', 'DataType', "C(3)")
*** DBCX Field Properties for DOVIZTIPILOOKUPVIEW1.doviz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFECDESCRIPT","Doviz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFECFRMCAPTN","Doviz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFECDLGCAPTN","Doviz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFECGRDCAPTN","Doviz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFECRPTCAPTN","Doviz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFEMTOOLTIP","Doviz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFEMSTATUSTXT","Doviz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.doviz_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DOVIZTIPILOOKUPVIEW1.aciklama field.
DBSetProp('DOVIZTIPILOOKUPVIEW1.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('DOVIZTIPILOOKUPVIEW1.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('DOVIZTIPILOOKUPVIEW1.aciklama', 'Field', 'UpdateName', 'hbysreferans!doviztipi.aciklama')
DBSetProp('DOVIZTIPILOOKUPVIEW1.aciklama', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for DOVIZTIPILOOKUPVIEW1.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFECFRMCAPTN","Aciklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFECDLGCAPTN","Aciklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFECGRDCAPTN","Aciklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFECRPTCAPTN","Aciklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFEMTOOLTIP","Aciklama") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFEMSTATUSTXT","Aciklama") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DOVIZTIPILOOKUPVIEW1.aciklama","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
