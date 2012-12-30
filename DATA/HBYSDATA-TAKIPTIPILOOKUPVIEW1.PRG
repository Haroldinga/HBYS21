***************** Begin View Definition TAKIPTIPILOOKUPVIEW1 ***************


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



CREATE SQL VIEW "TAKIPTIPILOOKUPVIEW1" ; 
	AS SELECT Takiptipi.takip_tipi,;
		Takiptipi.uyap_kodu;
	FROM hbysreferans!takiptipi

DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!takiptipi')
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('TAKIPTIPILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TAKIPTIPILOOKUPVIEW1
	GoExplorer.odbcx.Validate("TAKIPTIPILOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Takiptipilookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for TAKIPTIPILOOKUPVIEW1
*** Props for the TAKIPTIPILOOKUPVIEW1.takip_tipi field.
DBSetProp('TAKIPTIPILOOKUPVIEW1.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW1.takip_tipi', 'Field', 'Updatable', .T.)
DBSetProp('TAKIPTIPILOOKUPVIEW1.takip_tipi', 'Field', 'UpdateName', 'hbysreferans!takiptipi.takip_tipi')
DBSetProp('TAKIPTIPILOOKUPVIEW1.takip_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TAKIPTIPILOOKUPVIEW1.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.takip_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TAKIPTIPILOOKUPVIEW1.uyap_kodu field.
DBSetProp('TAKIPTIPILOOKUPVIEW1.uyap_kodu', 'Field', 'KeyField', .F.)
DBSetProp('TAKIPTIPILOOKUPVIEW1.uyap_kodu', 'Field', 'Updatable', .T.)
DBSetProp('TAKIPTIPILOOKUPVIEW1.uyap_kodu', 'Field', 'UpdateName', 'hbysreferans!takiptipi.uyap_kodu')
DBSetProp('TAKIPTIPILOOKUPVIEW1.uyap_kodu', 'Field', 'DataType', "I")
*** DBCX Field Properties for TAKIPTIPILOOKUPVIEW1.uyap_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFECDESCRIPT","Uyap Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFECFRMCAPTN","Uyap Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFECDLGCAPTN","Uyap Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFECGRDCAPTN","Uyap Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFECRPTCAPTN","Uyap Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFEMTOOLTIP","Uyap Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFEMSTATUSTXT","Uyap Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TAKIPTIPILOOKUPVIEW1.uyap_kodu","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
