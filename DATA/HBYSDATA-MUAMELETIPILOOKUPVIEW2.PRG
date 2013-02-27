***************** Begin View Definition MUAMELETIPILOOKUPVIEW ***************


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



CREATE SQL VIEW "MUAMELETIPILOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Raporlistesi.Rapor_Adi,;
		Raporlistesi.Talep_Ifadesi,;
		Muameletipi.Masraf_Tipi,;
		Muameletipi.Mal_Tipi,;
		MuameleTipi.Muhatap;
	FROM {oj dbo.RaporListesi Raporlistesi;
		LEFT OUTER JOIN dbo.MuameleTipi Muameletipi;
			ON Raporlistesi.Rapor_Adi = Muameletipi.Muzekkere_Adi};
	WHERE Raporlistesi.Rapor_Tipi IN ('Müzekkere','Ödeme Emri');
	ORDER BY Raporlistesi.Rapor_Adi

DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'Tables', 'dbo.RaporListesi,dbo.MuameleTipi')
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUAMELETIPILOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MUAMELETIPILOOKUPVIEW
	GoExplorer.odbcx.Validate("MUAMELETIPILOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","MuameleTipiLookUpView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for MUAMELETIPILOOKUPVIEW
*** Props for the MUAMELETIPILOOKUPVIEW.rapor_adi field.
DBSetProp('MUAMELETIPILOOKUPVIEW.rapor_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELETIPILOOKUPVIEW.rapor_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELETIPILOOKUPVIEW.rapor_adi', 'Field', 'UpdateName', 'dbo.RaporListesi.Rapor_Adi')
DBSetProp('MUAMELETIPILOOKUPVIEW.rapor_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELETIPILOOKUPVIEW.rapor_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECDESCRIPT","Rapor Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECFRMCAPTN","Muamele Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECDLGCAPTN","Muamele Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECGRDCAPTN","Muamele Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECRPTCAPTN","Muamele Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMTOOLTIP","Muamele Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMSTATUSTXT","Muamele Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.rapor_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUAMELETIPILOOKUPVIEW.talep_ifadesi field.
DBSetProp('MUAMELETIPILOOKUPVIEW.talep_ifadesi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELETIPILOOKUPVIEW.talep_ifadesi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELETIPILOOKUPVIEW.talep_ifadesi', 'Field', 'UpdateName', 'dbo.RaporListesi.Talep_Ifadesi')
DBSetProp('MUAMELETIPILOOKUPVIEW.talep_ifadesi', 'Field', 'DataType', "M")
*** DBCX Field Properties for MUAMELETIPILOOKUPVIEW.talep_ifadesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECDESCRIPT","Talep Ifadesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECFRMCAPTN","Talep Ifadesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECDLGCAPTN","Talep Ifadesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECGRDCAPTN","Talep Ifadesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECRPTCAPTN","Talep Ifadesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFEMTOOLTIP","Talep Ifadesi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFEMSTATUSTXT","Talep Ifadesi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.talep_ifadesi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUAMELETIPILOOKUPVIEW.masraf_tipi field.
DBSetProp('MUAMELETIPILOOKUPVIEW.masraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELETIPILOOKUPVIEW.masraf_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELETIPILOOKUPVIEW.masraf_tipi', 'Field', 'UpdateName', 'dbo.MuameleTipi.Masraf_Tipi')
DBSetProp('MUAMELETIPILOOKUPVIEW.masraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELETIPILOOKUPVIEW.masraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECDESCRIPT","Masraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.masraf_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUAMELETIPILOOKUPVIEW.mal_tipi field.
DBSetProp('MUAMELETIPILOOKUPVIEW.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELETIPILOOKUPVIEW.mal_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELETIPILOOKUPVIEW.mal_tipi', 'Field', 'UpdateName', 'dbo.MuameleTipi.Mal_Tipi')
DBSetProp('MUAMELETIPILOOKUPVIEW.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELETIPILOOKUPVIEW.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Al Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Al Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Al Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Al Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Al Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Al Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELETIPILOOKUPVIEW.mal_tipi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
