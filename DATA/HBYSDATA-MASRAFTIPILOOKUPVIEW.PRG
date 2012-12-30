***************** Begin View Definition MASRAFTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "MASRAFTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Masraftipi.MasrafTipi_Id,;
		Masraftipi.Masraf_Tipi,;
		Masraftipi.Masraf_Miktari;
	FROM dbo.MasrafTipi Masraftipi

DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'WhereType', 1)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.MasrafTipi')
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MASRAFTIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MASRAFTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("MASRAFTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Masraftipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for MASRAFTIPILOOKUPVIEW
*** Props for the MASRAFTIPILOOKUPVIEW.masraftipi_id field.
DBSetProp('MASRAFTIPILOOKUPVIEW.masraftipi_id', 'Field', 'KeyField', .T.)
DBSetProp('MASRAFTIPILOOKUPVIEW.masraftipi_id', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFTIPILOOKUPVIEW.masraftipi_id', 'Field', 'UpdateName', 'dbo.MasrafTipi.MasrafTipi_Id')
DBSetProp('MASRAFTIPILOOKUPVIEW.masraftipi_id', 'Field', 'DataType', "C(36)")
DBSetProp('MASRAFTIPILOOKUPVIEW.masraftipi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MASRAFTIPILOOKUPVIEW.masraftipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFECDESCRIPT","Masraftipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi ID                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi ID                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraftipi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MASRAFTIPILOOKUPVIEW.masraf_tipi field.
DBSetProp('MASRAFTIPILOOKUPVIEW.masraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFTIPILOOKUPVIEW.masraf_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFTIPILOOKUPVIEW.masraf_tipi', 'Field', 'UpdateName', 'dbo.MasrafTipi.Masraf_Tipi')
DBSetProp('MASRAFTIPILOOKUPVIEW.masraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MASRAFTIPILOOKUPVIEW.masraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECDESCRIPT","Masraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MASRAFTIPILOOKUPVIEW.masraf_miktari field.
DBSetProp('MASRAFTIPILOOKUPVIEW.masraf_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MASRAFTIPILOOKUPVIEW.masraf_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MASRAFTIPILOOKUPVIEW.masraf_miktari', 'Field', 'UpdateName', 'dbo.MasrafTipi.Masraf_Miktari')
DBSetProp('MASRAFTIPILOOKUPVIEW.masraf_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MASRAFTIPILOOKUPVIEW.masraf_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFECDESCRIPT","Masraf Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFECFRMCAPTN","Masraf Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFECDLGCAPTN","Masraf Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFECGRDCAPTN","Masraf Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFECRPTCAPTN","Masraf Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFEMTOOLTIP","Masraf Miktarý                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFEMSTATUSTXT","Masraf Miktarý                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MASRAFTIPILOOKUPVIEW.masraf_miktari","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
