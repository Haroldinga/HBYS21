***************** Begin View Definition UYAPALACAKVIEW ***************


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



CREATE SQL VIEW "UYAPALACAKVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Doviztipi.Uyap_Kodu AS tutartur,;
		Icradosyahesabi.Takip_Alacagi AS tutar,;
		CAST('1' AS CHAR(1)) AS alacakno,;
		Icradosya.Borc_Evragi As DigerAlacakAciklama,;
		CAST('DigerAlacak_6' AS CHAR(15)) AS alacak_id,;
		DovizTipi.Aciklama as TutarAdi;
	FROM {oj dbo.IcraDosyaHesabi Icradosyahesabi;
		INNER JOIN dbo.Alacak Alacak;
			ON Icradosyahesabi.IcraDosyaHesabi_Fk = Alacak.Alacak_Fk;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Icradosyahesabi.IcraDosyaHesabi_Fk = Icradosya.IcraDosya_Id;
		LEFT OUTER JOIN dbo.DovizTipi Doviztipi;
			ON Alacak.Doviz_Tipi = Doviztipi.Doviz_Tipi}

DBSetProp('UYAPALACAKVIEW', 'View', 'UpdateType', 1)
DBSetProp('UYAPALACAKVIEW', 'View', 'WhereType', 3)
DBSetProp('UYAPALACAKVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPALACAKVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPALACAKVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPALACAKVIEW', 'View', 'MaxRecords', -1)
DBSetProp('UYAPALACAKVIEW', 'View', 'Tables', 'dbo.IcraDosya')
DBSetProp('UYAPALACAKVIEW', 'View', 'Prepared', .F.)
DBSetProp('UYAPALACAKVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPALACAKVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPALACAKVIEW', 'View', 'FetchSize', 100)
DBSetProp('UYAPALACAKVIEW', 'View', 'Comment', "")
DBSetProp('UYAPALACAKVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPALACAKVIEW', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPALACAKVIEW
	GoExplorer.odbcx.Validate("UYAPALACAKVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW","VIEW",;
		"VFECDESCRIPT","Uyapalacakview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for UYAPALACAKVIEW
*** Props for the UYAPALACAKVIEW.tutartur field.
DBSetProp('UYAPALACAKVIEW.tutartur', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.tutartur', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.tutartur', 'Field', 'UpdateName', 'dbo.DovizTipi.Uyap_Kodu')
DBSetProp('UYAPALACAKVIEW.tutartur', 'Field', 'DataType', "C(8)")
*** DBCX Field Properties for UYAPALACAKVIEW.tutartur
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECDESCRIPT","Tutartur Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECFRMCAPTN","Tutartur") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECDLGCAPTN","Tutartur") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECGRDCAPTN","Tutartur") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECRPTCAPTN","Tutartur") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFEMTOOLTIP","Tutartur") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFEMSTATUSTXT","Tutartur") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutartur","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.tutar field.
DBSetProp('UYAPALACAKVIEW.tutar', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.tutar', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.tutar', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacagi')
DBSetProp('UYAPALACAKVIEW.tutar', 'Field', 'DataType', "N(10,2)")
*** DBCX Field Properties for UYAPALACAKVIEW.tutar
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECDESCRIPT","Tutar Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECFRMCAPTN","Tutar") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECDLGCAPTN","Tutar") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECGRDCAPTN","Tutar") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECRPTCAPTN","Tutar") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFEMTOOLTIP","Tutar") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFEMSTATUSTXT","Tutar") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.tutar","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.alacakno field.
DBSetProp('UYAPALACAKVIEW.alacakno', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.alacakno', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.alacakno', 'Field', 'UpdateName', 'AlacakNo')
DBSetProp('UYAPALACAKVIEW.alacakno', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPALACAKVIEW.alacakno
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECDESCRIPT","Alacakno Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECFRMCAPTN","Alacakno") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECDLGCAPTN","Alacakno") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECGRDCAPTN","Alacakno") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECRPTCAPTN","Alacakno") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFEMTOOLTIP","Alacakno") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFEMSTATUSTXT","Alacakno") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacakno","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the UYAPALACAKVIEW.borc_evragi field.
*** DBCX Field Properties for UYAPALACAKVIEW.borc_evragi
IF lWriteDBCXProps
ENDIF
 
*** Props for the UYAPALACAKVIEW.alacak_id field.
DBSetProp('UYAPALACAKVIEW.alacak_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPALACAKVIEW.alacak_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPALACAKVIEW.alacak_id', 'Field', 'UpdateName', 'Alacak_Id')
DBSetProp('UYAPALACAKVIEW.alacak_id', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for UYAPALACAKVIEW.alacak_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECDESCRIPT","Alacak Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECFRMCAPTN","Alacak Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECDLGCAPTN","Alacak Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECGRDCAPTN","Alacak Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECRPTCAPTN","Alacak Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFEMTOOLTIP","Alacak Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFEMSTATUSTXT","Alacak Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPALACAKVIEW.alacak_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
