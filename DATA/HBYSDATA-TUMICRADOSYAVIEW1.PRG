***************** Begin View Definition TUMICRADOSYAVIEW ***************


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



CREATE SQL VIEW "TUMICRADOSYAVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Borclu.TcKimlik_No,;
		Borclu.Ticaret_Sicil_No,;
		Borclu.Borclu_Adi,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Muvekkil_Adi,;
		Icradosya.Sube_Id,;
		Sube.Sube_Adi,;
		Icradosya.Dosya_Tipi,;
		Icradosya.Takip_Tipi,;
		Icradosya.Borc_Tipi,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Dosya_Statusu,;
		Icradosyahesabi.Asil_Alacak,;
		Icradosyahesabi.Takip_Alacagi,;
		Icradosyahesabi.Toplam_Alacak,;
		Icradosyahesabi.TS_Tahsilat_Tutari,;
		CAST(Icradosyahesabi.toplam_alacak-Icradosyahesabi.ts_tahsilat_tutari;
		AS MONEY) AS kalan_alacak;
	FROM {oj dbo.Borclu Borclu;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Borclu.Borclu_Fk = Icradosya.IcraDosya_Id;
		LEFT OUTER JOIN dbo.Sube Sube;
			ON Icradosya.Sube_Id = Sube.Sube_Id};
		INNER JOIN dbo.IcraDosyaHesabi Icradosyahesabi;
			ON Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk;
	WHERE Borclu.Rehber_Id IN (SELECT Borclu2.Rehber_Id;
	FROM dbo.Borclu Borclu2;
	WHERE Borclu2.Borclu_Fk=?vp_IcraDosya_Id)

DBSetProp('TUMICRADOSYAVIEW', 'View', 'UpdateType', 1)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'WhereType', 3)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'Tables', 'dbo.IcraDosyaHesabi')
DBSetProp('TUMICRADOSYAVIEW', 'View', 'Prepared', .F.)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'FetchSize', -1)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'ParameterList', "vp_IcraDosya_Id,'C'")
DBSetProp('TUMICRADOSYAVIEW', 'View', 'Comment', "")
DBSetProp('TUMICRADOSYAVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TUMICRADOSYAVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TUMICRADOSYAVIEW
	GoExplorer.odbcx.Validate("TUMICRADOSYAVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW","VIEW",;
		"VFECDESCRIPT","TUMICRADOSYAVIEW Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_IcraDosya_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Icradosya Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for TUMICRADOSYAVIEW
*** Props for the TUMICRADOSYAVIEW.tckimlik_no field.
DBSetProp('TUMICRADOSYAVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.tckimlik_no', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Borclu.TcKimlik_No')
DBSetProp('TUMICRADOSYAVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.ticaret_sicil_no field.
DBSetProp('TUMICRADOSYAVIEW.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.ticaret_sicil_no', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Borclu.Ticaret_Sicil_No')
DBSetProp('TUMICRADOSYAVIEW.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Ticaret Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Ticaret Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Ticaret Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Ticaret Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.borclu_adi field.
DBSetProp('TUMICRADOSYAVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('TUMICRADOSYAVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.buro_dosya_no field.
DBSetProp('TUMICRADOSYAVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('TUMICRADOSYAVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for TUMICRADOSYAVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Semiramis No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Semiramis No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.buro_dosya_no","FIELD",;
		"VFEMFORMAT","ZK") &&Format
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.icra_dosya_no field.
DBSetProp('TUMICRADOSYAVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('TUMICRADOSYAVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.muvekkil_adi field.
DBSetProp('TUMICRADOSYAVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('TUMICRADOSYAVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.sube_id field.
DBSetProp('TUMICRADOSYAVIEW.sube_id', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.sube_id', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.sube_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Sube_Id')
DBSetProp('TUMICRADOSYAVIEW.sube_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.sube_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECDESCRIPT","Sube Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECFRMCAPTN","Þube") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECDLGCAPTN","Þube") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECGRDCAPTN","Þube") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECRPTCAPTN","Þube") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFEMTOOLTIP","Þube                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFEMSTATUSTXT","Þube                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECLUTABLE","hbysdata!subelookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECLUTAG","sube_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFEMLUFIELDS","sube_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFEMLUUPDTEXP","Subelookupview.sube_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_id","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.sube_adi field.
DBSetProp('TUMICRADOSYAVIEW.sube_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.sube_adi', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.sube_adi', 'Field', 'UpdateName', 'dbo.Sube.Sube_Adi')
DBSetProp('TUMICRADOSYAVIEW.sube_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.sube_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFECDESCRIPT","Sube Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFECFRMCAPTN","Þube Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFECDLGCAPTN","Þube Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFECGRDCAPTN","Þube Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFECRPTCAPTN","Þube Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFEMTOOLTIP","Þube Adý                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFEMSTATUSTXT","Þube Adý                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.sube_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.dosya_tipi field.
DBSetProp('TUMICRADOSYAVIEW.dosya_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.dosya_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.dosya_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Tipi')
DBSetProp('TUMICRADOSYAVIEW.dosya_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.dosya_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFECDESCRIPT","Dosya Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFECFRMCAPTN","Dosya Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFECDLGCAPTN","Dosya Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFECGRDCAPTN","Dosya Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFECRPTCAPTN","Dosya Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFEMTOOLTIP","Dosya Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_tipi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.takip_tipi field.
DBSetProp('TUMICRADOSYAVIEW.takip_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.takip_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.takip_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tipi')
DBSetProp('TUMICRADOSYAVIEW.takip_tipi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.takip_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECDESCRIPT","Takip Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECFRMCAPTN","Takip Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECDLGCAPTN","Takip Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECGRDCAPTN","Takip Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECRPTCAPTN","Takip Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFEMTOOLTIP","Takip Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFEMSTATUSTXT","Takip Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!takiptipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECLUTAG","takip_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFEMLUFIELDS","takip_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFEMLUUPDTEXP","Takiptipilookupview.takip_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.borc_tipi field.
DBSetProp('TUMICRADOSYAVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('TUMICRADOSYAVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.icramudurlugu_adi field.
DBSetProp('TUMICRADOSYAVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.icramudurlugu_adi', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('TUMICRADOSYAVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECLUTABLE","hbysdata!icramudurlugulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECLUTAG","icramudurlugu_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFEMLUFIELDS","icramudurlugu_adi, adliye_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFEMLUUPDTEXP","Icramudurlugulookupview.icramudurlugu_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.icramudurlugu_adi","FIELD",;
		"VFEMLUUPDFLDS","adliye_adi, icramudurlugu_id") &&After Lookup Update Field List
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.dosya_statusu field.
DBSetProp('TUMICRADOSYAVIEW.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.dosya_statusu', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.dosya_statusu', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Statusu')
DBSetProp('TUMICRADOSYAVIEW.dosya_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMICRADOSYAVIEW.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECLUTABLE","hbysdata!dosyastatulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECLUTAG","dosya_statusu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFEMLUFIELDS","dosya_statusu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFEMLUUPDTEXP","Dosyastatulookupview.dosya_statusu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECADDFORM","DOSYASTATULOOKUPVIEWFORM") &&Look Up Add Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.dosya_statusu","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.asil_alacak field.
DBSetProp('TUMICRADOSYAVIEW.asil_alacak', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.asil_alacak', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.asil_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Asil_Alacak')
DBSetProp('TUMICRADOSYAVIEW.asil_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TUMICRADOSYAVIEW.asil_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFECDESCRIPT","Asil Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFECFRMCAPTN","Asýl Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFECDLGCAPTN","Asýl Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFECGRDCAPTN","Asýl Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFECRPTCAPTN","Asýl Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFEMTOOLTIP","Asýl Alacak                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFEMSTATUSTXT","Asýl Alacak                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFENDISPORDER",14) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.asil_alacak","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.takip_alacagi field.
DBSetProp('TUMICRADOSYAVIEW.takip_alacagi', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.takip_alacagi', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.takip_alacagi', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Takip_Alacagi')
DBSetProp('TUMICRADOSYAVIEW.takip_alacagi', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TUMICRADOSYAVIEW.takip_alacagi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFECDESCRIPT","Takip Alacagi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFECFRMCAPTN","Takip Alacaðý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFECDLGCAPTN","Takip Alacaðý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFECGRDCAPTN","Takip Alacaðý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFECRPTCAPTN","Takip Alacaðý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFEMTOOLTIP","Takip Alacaðý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFEMSTATUSTXT","Takip Alacaðý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.takip_alacagi","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.toplam_alacak field.
DBSetProp('TUMICRADOSYAVIEW.toplam_alacak', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.toplam_alacak', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.toplam_alacak', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.Toplam_Alacak')
DBSetProp('TUMICRADOSYAVIEW.toplam_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TUMICRADOSYAVIEW.toplam_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFECDESCRIPT","Toplam Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFECFRMCAPTN","Toplam Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFECDLGCAPTN","Toplam Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFECGRDCAPTN","Toplam Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFECRPTCAPTN","Toplam Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFEMTOOLTIP","Toplam Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFEMSTATUSTXT","Toplam Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFENDISPORDER",13) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.toplam_alacak","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.ts_tahsilat_tutari field.
DBSetProp('TUMICRADOSYAVIEW.ts_tahsilat_tutari', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.ts_tahsilat_tutari', 'Field', 'Updatable', .T.)
DBSetProp('TUMICRADOSYAVIEW.ts_tahsilat_tutari', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Tahsilat_Tutari')
DBSetProp('TUMICRADOSYAVIEW.ts_tahsilat_tutari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TUMICRADOSYAVIEW.ts_tahsilat_tutari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECDESCRIPT","Ts Tahsilat Tutari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tutarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tutarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tutarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tutarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tutarý                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tutarý                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFENDISPORDER",17) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.ts_tahsilat_tutari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the TUMICRADOSYAVIEW.kalan_alacak field.
DBSetProp('TUMICRADOSYAVIEW.kalan_alacak', 'Field', 'KeyField', .F.)
DBSetProp('TUMICRADOSYAVIEW.kalan_alacak', 'Field', 'Updatable', .F.)
DBSetProp('TUMICRADOSYAVIEW.kalan_alacak', 'Field', 'UpdateName', 'Kalan_Alacak')
DBSetProp('TUMICRADOSYAVIEW.kalan_alacak', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TUMICRADOSYAVIEW.kalan_alacak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFECDESCRIPT","Kalan Alacak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFECFRMCAPTN","Kalan Alacak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFECDLGCAPTN","Kalan Alacak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFECGRDCAPTN","Kalan Alacak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFECRPTCAPTN","Kalan Alacak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFEMTOOLTIP","Kalan Alacak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFEMSTATUSTXT","Kalan Alacak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFENDISPORDER",18) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMICRADOSYAVIEW.kalan_alacak","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
