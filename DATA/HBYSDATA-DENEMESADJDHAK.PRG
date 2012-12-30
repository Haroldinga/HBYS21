***************** Begin View Definition DENEMESADJDHAK ***************


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



CREATE SQL VIEW "DENEMESADJDHAK" ; 
	AS SELECT Takiptipi.takip_tipi,;
		Takiptipi.oe_ornek_adi,;
		Takiptipi.uyap_kodu;
	FROM hbysreferans!takiptipi

DBSetProp('DENEMESADJDHAK', 'View', 'UpdateType', 1)
DBSetProp('DENEMESADJDHAK', 'View', 'WhereType', 3)
DBSetProp('DENEMESADJDHAK', 'View', 'FetchMemo', .T.)
DBSetProp('DENEMESADJDHAK', 'View', 'SendUpdates', .F.)
DBSetProp('DENEMESADJDHAK', 'View', 'UseMemoSize', 255)
DBSetProp('DENEMESADJDHAK', 'View', 'MaxRecords', -1)
DBSetProp('DENEMESADJDHAK', 'View', 'Tables', 'hbysreferans!takiptipi')
DBSetProp('DENEMESADJDHAK', 'View', 'Prepared', .F.)
DBSetProp('DENEMESADJDHAK', 'View', 'CompareMemo', .T.)
DBSetProp('DENEMESADJDHAK', 'View', 'FetchAsNeeded', .F.)
DBSetProp('DENEMESADJDHAK', 'View', 'FetchSize', 100)
DBSetProp('DENEMESADJDHAK', 'View', 'Comment', "")
DBSetProp('DENEMESADJDHAK', 'View', 'BatchUpdateCount', 1)
DBSetProp('DENEMESADJDHAK', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for DENEMESADJDHAK
	GoExplorer.odbcx.Validate("DENEMESADJDHAK","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK","VIEW",;
		"VFECDESCRIPT","Denemesadjdhak Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for DENEMESADJDHAK
*** Props for the DENEMESADJDHAK.takip_tipi field.
DBSetProp('DENEMESADJDHAK.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('DENEMESADJDHAK.takip_tipi', 'Field', 'Updatable', .F.)
DBSetProp('DENEMESADJDHAK.takip_tipi', 'Field', 'UpdateName', 'hbysreferans!takiptipi.takip_tipi')
DBSetProp('DENEMESADJDHAK.takip_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for DENEMESADJDHAK.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.takip_tipi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the DENEMESADJDHAK.oe_ornek_adi field.
DBSetProp('DENEMESADJDHAK.oe_ornek_adi', 'Field', 'KeyField', .F.)
DBSetProp('DENEMESADJDHAK.oe_ornek_adi', 'Field', 'Updatable', .F.)
DBSetProp('DENEMESADJDHAK.oe_ornek_adi', 'Field', 'UpdateName', 'hbysreferans!takiptipi.oe_ornek_adi')
DBSetProp('DENEMESADJDHAK.oe_ornek_adi', 'Field', 'DataType', "C(10)")
*** DBCX Field Properties for DENEMESADJDHAK.oe_ornek_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFECDESCRIPT","Oe Ornek Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFECFRMCAPTN","Oe Ornek Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFECDLGCAPTN","Oe Ornek Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFECGRDCAPTN","Oe Ornek Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFECRPTCAPTN","Oe Ornek Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFEMTOOLTIP","Oe Ornek Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFEMSTATUSTXT","Oe Ornek Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.oe_ornek_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the DENEMESADJDHAK.uyap_kodu field.
DBSetProp('DENEMESADJDHAK.uyap_kodu', 'Field', 'KeyField', .F.)
DBSetProp('DENEMESADJDHAK.uyap_kodu', 'Field', 'Updatable', .F.)
DBSetProp('DENEMESADJDHAK.uyap_kodu', 'Field', 'UpdateName', 'hbysreferans!takiptipi.uyap_kodu')
DBSetProp('DENEMESADJDHAK.uyap_kodu', 'Field', 'DataType', "I")
*** DBCX Field Properties for DENEMESADJDHAK.uyap_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFECDESCRIPT","Uyap Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFECFRMCAPTN","Uyap Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFECDLGCAPTN","Uyap Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFECGRDCAPTN","Uyap Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFECRPTCAPTN","Uyap Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFEMTOOLTIP","Uyap Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFEMSTATUSTXT","Uyap Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!DENEMESADJDHAK.uyap_kodu","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
