***************** Begin View Definition MUZEKKERETIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "MUZEKKERETIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Raporlistesi.RaporListesi_Fk,;
		Raporlistesi.Rapor_Adi,;
		Raporlistesi.Talep_Ifadesi,;
		Raporlistesi.Zarf_Adi;
	FROM dbo.RaporListesi Raporlistesi;
	WHERE Raporlistesi.Rapor_Tipi IN ('Müzekkere','Ödeme Emri')

DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'Tables', 'dbo.RaporListesi')
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUZEKKERETIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MUZEKKERETIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("MUZEKKERETIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Muzekkeretipilookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for MUZEKKERETIPILOOKUPVIEW
*** Props for the MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk field.
DBSetProp('MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk', 'Field', 'KeyField', .F.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk', 'Field', 'Updatable', .T.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk', 'Field', 'UpdateName', 'dbo.RaporListesi.RaporListesi_Fk')
DBSetProp('MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk', 'Field', 'DataType', "C(16)")
*** DBCX Field Properties for MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFECDESCRIPT","Raporlistesi Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFECFRMCAPTN","Raporlistesi Fk") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFECDLGCAPTN","Raporlistesi Fk") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFECGRDCAPTN","Raporlistesi Fk") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFECRPTCAPTN","Raporlistesi Fk") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFEMTOOLTIP","Raporlistesi Fk") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFEMSTATUSTXT","Raporlistesi Fk") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.raporlistesi_fk","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MUZEKKERETIPILOOKUPVIEW.rapor_adi field.
DBSetProp('MUZEKKERETIPILOOKUPVIEW.rapor_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW.rapor_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW.rapor_adi', 'Field', 'UpdateName', 'dbo.RaporListesi.Rapor_Adi')
DBSetProp('MUZEKKERETIPILOOKUPVIEW.rapor_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUZEKKERETIPILOOKUPVIEW.rapor_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECDESCRIPT","Rapor Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECFRMCAPTN","Rapor Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECDLGCAPTN","Rapor Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECGRDCAPTN","Rapor Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECRPTCAPTN","Rapor Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMTOOLTIP","Rapor Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMSTATUSTXT","Rapor Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUZEKKERETIPILOOKUPVIEW.talep_ifadesi field.
DBSetProp('MUZEKKERETIPILOOKUPVIEW.talep_ifadesi', 'Field', 'KeyField', .F.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW.talep_ifadesi', 'Field', 'Updatable', .T.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW.talep_ifadesi', 'Field', 'UpdateName', 'dbo.RaporListesi.Talep_Ifadesi')
DBSetProp('MUZEKKERETIPILOOKUPVIEW.talep_ifadesi', 'Field', 'DataType', "M")
*** DBCX Field Properties for MUZEKKERETIPILOOKUPVIEW.talep_ifadesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECDESCRIPT","Talep Ifadesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECFRMCAPTN","Talep Ifadesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECDLGCAPTN","Talep Ifadesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECGRDCAPTN","Talep Ifadesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECRPTCAPTN","Talep Ifadesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFEMTOOLTIP","Talep Ifadesi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFEMSTATUSTXT","Talep Ifadesi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MUZEKKERETIPILOOKUPVIEW.zarf_adi field.
DBSetProp('MUZEKKERETIPILOOKUPVIEW.zarf_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW.zarf_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUZEKKERETIPILOOKUPVIEW.zarf_adi', 'Field', 'UpdateName', 'dbo.RaporListesi.Zarf_Adi')
DBSetProp('MUZEKKERETIPILOOKUPVIEW.zarf_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUZEKKERETIPILOOKUPVIEW.zarf_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFECDESCRIPT","Zarf Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFECFRMCAPTN","Zarf Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFECDLGCAPTN","Zarf Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFECGRDCAPTN","Zarf Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFECRPTCAPTN","Zarf Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFEMTOOLTIP","Zarf Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFEMSTATUSTXT","Zarf Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUZEKKERETIPILOOKUPVIEW.zarf_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
