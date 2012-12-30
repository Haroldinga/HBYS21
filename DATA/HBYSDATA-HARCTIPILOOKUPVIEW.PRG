***************** Begin View Definition HARCTIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "HARCTIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Harctipi.Harc_Tipi,;
		Harctipi.Harc_Orani,;
		Harctipi.Harc_Miktari;
	FROM dbo.HarcTipi Harctipi

DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'Tables', 'dbo.HarcTipi')
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('HARCTIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for HARCTIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("HARCTIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Harctipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ilibs\iData.vcx") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for HARCTIPILOOKUPVIEW
*** Props for the HARCTIPILOOKUPVIEW.harc_tipi field.
DBSetProp('HARCTIPILOOKUPVIEW.harc_tipi', 'Field', 'KeyField', .T.)
DBSetProp('HARCTIPILOOKUPVIEW.harc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('HARCTIPILOOKUPVIEW.harc_tipi', 'Field', 'UpdateName', 'dbo.HarcTipi.Harc_Tipi')
DBSetProp('HARCTIPILOOKUPVIEW.harc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for HARCTIPILOOKUPVIEW.harc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFECDESCRIPT","Harc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFECFRMCAPTN","Harç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFECDLGCAPTN","Harç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFECGRDCAPTN","Harç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFECRPTCAPTN","Harç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFEMTOOLTIP","Harç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFEMSTATUSTXT","Harç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the HARCTIPILOOKUPVIEW.harc_orani field.
DBSetProp('HARCTIPILOOKUPVIEW.harc_orani', 'Field', 'KeyField', .F.)
DBSetProp('HARCTIPILOOKUPVIEW.harc_orani', 'Field', 'Updatable', .T.)
DBSetProp('HARCTIPILOOKUPVIEW.harc_orani', 'Field', 'UpdateName', 'dbo.HarcTipi.Harc_Orani')
DBSetProp('HARCTIPILOOKUPVIEW.harc_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCTIPILOOKUPVIEW.harc_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFECDESCRIPT","Harc Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFECFRMCAPTN","Harc Orani") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFECDLGCAPTN","Harc Orani") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFECGRDCAPTN","Harc Orani") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFECRPTCAPTN","Harc Orani") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFEMTOOLTIP","Harc Orani") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFEMSTATUSTXT","Harc Orani") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_orani","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the HARCTIPILOOKUPVIEW.harc_miktari field.
DBSetProp('HARCTIPILOOKUPVIEW.harc_miktari', 'Field', 'KeyField', .F.)
DBSetProp('HARCTIPILOOKUPVIEW.harc_miktari', 'Field', 'Updatable', .T.)
DBSetProp('HARCTIPILOOKUPVIEW.harc_miktari', 'Field', 'UpdateName', 'dbo.HarcTipi.Harc_Miktari')
DBSetProp('HARCTIPILOOKUPVIEW.harc_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for HARCTIPILOOKUPVIEW.harc_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFECDESCRIPT","Harc Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFECFRMCAPTN","Harc Miktari") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFECDLGCAPTN","Harc Miktari") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFECGRDCAPTN","Harc Miktari") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFECRPTCAPTN","Harc Miktari") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFEMTOOLTIP","Harc Miktari") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFEMSTATUSTXT","Harc Miktari") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!HARCTIPILOOKUPVIEW.harc_miktari","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
