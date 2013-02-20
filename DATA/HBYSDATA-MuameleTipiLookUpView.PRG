***************** Begin View Definition MuameleTipiLookUpView ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
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



CREATE SQL VIEW "MuameleTipiLookUpView" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Raporlistesi.RaporListesi_Fk,;
		Raporlistesi.Rapor_Adi,;
		Raporlistesi.Talep_Ifadesi,;
		Raporlistesi.Zarf_Adi;
	FROM dbo.RaporListesi Raporlistesi;
	WHERE Raporlistesi.Rapor_Tipi IN ('Müzekkere','Ödeme Emri');
	ORDER BY Raporlistesi.Rapor_Adi

DBSetProp('MuameleTipiLookUpView', 'View', 'UpdateType', 1)
DBSetProp('MuameleTipiLookUpView', 'View', 'WhereType', 3)
DBSetProp('MuameleTipiLookUpView', 'View', 'FetchMemo', .T.)
DBSetProp('MuameleTipiLookUpView', 'View', 'SendUpdates', .F.)
DBSetProp('MuameleTipiLookUpView', 'View', 'UseMemoSize', 255)
DBSetProp('MuameleTipiLookUpView', 'View', 'MaxRecords', -1)
DBSetProp('MuameleTipiLookUpView', 'View', 'Tables', 'dbo.RaporListesi')
DBSetProp('MuameleTipiLookUpView', 'View', 'Prepared', .F.)
DBSetProp('MuameleTipiLookUpView', 'View', 'CompareMemo', .T.)
DBSetProp('MuameleTipiLookUpView', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MuameleTipiLookUpView', 'View', 'FetchSize', -1)
DBSetProp('MuameleTipiLookUpView', 'View', 'Comment', "")
DBSetProp('MuameleTipiLookUpView', 'View', 'BatchUpdateCount', 1)
DBSetProp('MuameleTipiLookUpView', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MuameleTipiLookUpView
	GoExplorer.odbcx.Validate("MuameleTipiLookUpView","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView","VIEW",;
		"VFECDESCRIPT","MuameleTipiLookUpView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for MuameleTipiLookUpView
*** Props for the MuameleTipiLookUpView.raporlistesi_fk field.
DBSetProp('MuameleTipiLookUpView.raporlistesi_fk', 'Field', 'KeyField', .F.)
DBSetProp('MuameleTipiLookUpView.raporlistesi_fk', 'Field', 'Updatable', .T.)
DBSetProp('MuameleTipiLookUpView.raporlistesi_fk', 'Field', 'UpdateName', 'dbo.RaporListesi.RaporListesi_Fk')
DBSetProp('MuameleTipiLookUpView.raporlistesi_fk', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for MuameleTipiLookUpView.raporlistesi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFECDESCRIPT","Raporlistesi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFECFRMCAPTN","Raporlistesi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFECDLGCAPTN","Raporlistesi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFECGRDCAPTN","Raporlistesi Fk") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFECRPTCAPTN","Raporlistesi Fk") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFEMTOOLTIP","Raporlistesi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFEMSTATUSTXT","Raporlistesi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.raporlistesi_fk","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MuameleTipiLookUpView.rapor_adi field.
DBSetProp('MuameleTipiLookUpView.rapor_adi', 'Field', 'KeyField', .F.)
DBSetProp('MuameleTipiLookUpView.rapor_adi', 'Field', 'Updatable', .T.)
DBSetProp('MuameleTipiLookUpView.rapor_adi', 'Field', 'UpdateName', 'dbo.RaporListesi.Rapor_Adi')
DBSetProp('MuameleTipiLookUpView.rapor_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MuameleTipiLookUpView.rapor_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFECDESCRIPT","Rapor Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFECFRMCAPTN","Rapor Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFECDLGCAPTN","Rapor Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFECGRDCAPTN","Rapor Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFECRPTCAPTN","Rapor Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFEMTOOLTIP","Rapor Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFEMSTATUSTXT","Rapor Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.rapor_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MuameleTipiLookUpView.talep_ifadesi field.
DBSetProp('MuameleTipiLookUpView.talep_ifadesi', 'Field', 'KeyField', .F.)
DBSetProp('MuameleTipiLookUpView.talep_ifadesi', 'Field', 'Updatable', .T.)
DBSetProp('MuameleTipiLookUpView.talep_ifadesi', 'Field', 'UpdateName', 'dbo.RaporListesi.Talep_Ifadesi')
DBSetProp('MuameleTipiLookUpView.talep_ifadesi', 'Field', 'DataType', "M")
*** DBCX Field Properties for MuameleTipiLookUpView.talep_ifadesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFECDESCRIPT","Talep Ifadesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFECFRMCAPTN","Talep Ifadesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFECDLGCAPTN","Talep Ifadesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFECGRDCAPTN","Talep Ifadesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFECRPTCAPTN","Talep Ifadesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFEMTOOLTIP","Talep Ifadesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFEMSTATUSTXT","Talep Ifadesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.talep_ifadesi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MuameleTipiLookUpView.zarf_adi field.
DBSetProp('MuameleTipiLookUpView.zarf_adi', 'Field', 'KeyField', .F.)
DBSetProp('MuameleTipiLookUpView.zarf_adi', 'Field', 'Updatable', .T.)
DBSetProp('MuameleTipiLookUpView.zarf_adi', 'Field', 'UpdateName', 'dbo.RaporListesi.Zarf_Adi')
DBSetProp('MuameleTipiLookUpView.zarf_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MuameleTipiLookUpView.zarf_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFECDESCRIPT","Zarf Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFECFRMCAPTN","Zarf Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFECDLGCAPTN","Zarf Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFECGRDCAPTN","Zarf Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFECRPTCAPTN","Zarf Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFEMTOOLTIP","Zarf Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFEMSTATUSTXT","Zarf Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MuameleTipiLookUpView.zarf_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
