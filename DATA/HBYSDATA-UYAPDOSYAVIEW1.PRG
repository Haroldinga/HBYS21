***************** Begin View Definition UYAPDOSYAVIEW ***************


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



CREATE SQL VIEW "UYAPDOSYAVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Takiptipi.Uyap_Kodu AS takiptipi_uyap_kodu,;
		Takipyolu.Uyap_Kodu AS takipyolu_uyap_kodu,;
		Takipsekli.Uyap_Kodu AS takipsekli_uyap_kodu,;
		Icradosya.Talep_Edilen_Hak,;
		Icradosya.BK84Madde_Uygulansin,;
		Icradosya.BSMV_Uygulansin,;
		Icradosya.KKDF_Uygulansin,;
		Borclu.Borclu_Adi,;
		Icradosya.IcraDosya_Id,;
		Icradosya.Muvekkil_Id;
	FROM {oj{oj{oj{oj dbo.IcraDosya Icradosya;
		LEFT OUTER JOIN dbo.TakipTipi Takiptipi;
			ON Icradosya.Takip_Tipi = Takiptipi.Takip_Tipi};
		LEFT OUTER JOIN dbo.Borclu Borclu;
			ON Icradosya.IcraDosya_Id = Borclu.Borclu_Fk};
		LEFT OUTER JOIN dbo.TakipSekli Takipsekli;
			ON Icradosya.TakipSekli_Id = Takipsekli.TakipSekli_Id};
		LEFT OUTER JOIN dbo.TakipYolu Takipyolu;
			ON Icradosya.Takip_Yolu = Takipyolu.Takip_Yolu}

DBSetProp('UYAPDOSYAVIEW', 'View', 'UpdateType', 1)
DBSetProp('UYAPDOSYAVIEW', 'View', 'WhereType', 3)
DBSetProp('UYAPDOSYAVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('UYAPDOSYAVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('UYAPDOSYAVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('UYAPDOSYAVIEW', 'View', 'MaxRecords', -1)
DBSetProp('UYAPDOSYAVIEW', 'View', 'Tables', 'dbo.IcraDosya,dbo.Borclu')
DBSetProp('UYAPDOSYAVIEW', 'View', 'Prepared', .F.)
DBSetProp('UYAPDOSYAVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('UYAPDOSYAVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('UYAPDOSYAVIEW', 'View', 'FetchSize', -1)
DBSetProp('UYAPDOSYAVIEW', 'View', 'ParameterList', "vp_Icra_Dosya_No,'C';vp_Buro_Dosya_No,'V'")
DBSetProp('UYAPDOSYAVIEW', 'View', 'Comment', "")
DBSetProp('UYAPDOSYAVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('UYAPDOSYAVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for UYAPDOSYAVIEW
	GoExplorer.odbcx.Validate("UYAPDOSYAVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW","VIEW",;
		"VFECDESCRIPT","Uyapdosyaview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Icra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Icra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Icra Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Icra Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Icra_Dosya_No") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Buro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Buro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Buro Dosya No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Buro Dosya No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Buro_Dosya_No") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
ENDIF

*!* Field Level Properties for UYAPDOSYAVIEW
*** Props for the UYAPDOSYAVIEW.takiptipi_uyap_kodu field.
DBSetProp('UYAPDOSYAVIEW.takiptipi_uyap_kodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPDOSYAVIEW.takiptipi_uyap_kodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPDOSYAVIEW.takiptipi_uyap_kodu', 'Field', 'UpdateName', 'dbo.TakipTipi.Uyap_Kodu')
DBSetProp('UYAPDOSYAVIEW.takiptipi_uyap_kodu', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPDOSYAVIEW.takiptipi_uyap_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFECDESCRIPT","Takiptipi Uyap Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFECFRMCAPTN","Takiptipi Uyap Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFECDLGCAPTN","Takiptipi Uyap Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFECGRDCAPTN","Takiptipi Uyap Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFECRPTCAPTN","Takiptipi Uyap Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFEMTOOLTIP","Takiptipi Uyap Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFEMSTATUSTXT","Takiptipi Uyap Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takiptipi_uyap_kodu","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the UYAPDOSYAVIEW.takipyolu_uyap_kodu field.
DBSetProp('UYAPDOSYAVIEW.takipyolu_uyap_kodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPDOSYAVIEW.takipyolu_uyap_kodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPDOSYAVIEW.takipyolu_uyap_kodu', 'Field', 'UpdateName', 'dbo.TakipYolu.Uyap_Kodu')
DBSetProp('UYAPDOSYAVIEW.takipyolu_uyap_kodu', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPDOSYAVIEW.takipyolu_uyap_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFECDESCRIPT","Takipyolu Uyap Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFECFRMCAPTN","Takipyolu Uyap Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFECDLGCAPTN","Takipyolu Uyap Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFECGRDCAPTN","Takipyolu Uyap Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFECRPTCAPTN","Takipyolu Uyap Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFEMTOOLTIP","Takipyolu Uyap Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFEMSTATUSTXT","Takipyolu Uyap Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipyolu_uyap_kodu","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the UYAPDOSYAVIEW.takipsekli_uyap_kodu field.
DBSetProp('UYAPDOSYAVIEW.takipsekli_uyap_kodu', 'Field', 'KeyField', .F.)
DBSetProp('UYAPDOSYAVIEW.takipsekli_uyap_kodu', 'Field', 'Updatable', .F.)
DBSetProp('UYAPDOSYAVIEW.takipsekli_uyap_kodu', 'Field', 'UpdateName', 'dbo.TakipSekli.Uyap_Kodu')
DBSetProp('UYAPDOSYAVIEW.takipsekli_uyap_kodu', 'Field', 'DataType', "C(1)")
*** DBCX Field Properties for UYAPDOSYAVIEW.takipsekli_uyap_kodu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFECDESCRIPT","Takipsekli Uyap Kodu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFECFRMCAPTN","Takipsekli Uyap Kodu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFECDLGCAPTN","Takipsekli Uyap Kodu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFECGRDCAPTN","Takipsekli Uyap Kodu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFECRPTCAPTN","Takipsekli Uyap Kodu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFEMTOOLTIP","Takipsekli Uyap Kodu") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFEMSTATUSTXT","Takipsekli Uyap Kodu") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.takipsekli_uyap_kodu","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the UYAPDOSYAVIEW.talep_edilen_hak field.
DBSetProp('UYAPDOSYAVIEW.talep_edilen_hak', 'Field', 'KeyField', .F.)
DBSetProp('UYAPDOSYAVIEW.talep_edilen_hak', 'Field', 'Updatable', .T.)
DBSetProp('UYAPDOSYAVIEW.talep_edilen_hak', 'Field', 'UpdateName', 'dbo.IcraDosya.Talep_Edilen_Hak')
DBSetProp('UYAPDOSYAVIEW.talep_edilen_hak', 'Field', 'DataType', "M")
*** DBCX Field Properties for UYAPDOSYAVIEW.talep_edilen_hak
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFECDESCRIPT","Talep Edilen Hak Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFECFRMCAPTN","Talep Edilen Hak") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFECDLGCAPTN","Talep Edilen Hak") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFECGRDCAPTN","Talep Edilen Hak") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFECRPTCAPTN","Talep Edilen Hak") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFEMTOOLTIP","Talep Edilen Hak") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFEMSTATUSTXT","Talep Edilen Hak") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.talep_edilen_hak","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the UYAPDOSYAVIEW.bk84madde_uygulansin field.
DBSetProp('UYAPDOSYAVIEW.bk84madde_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('UYAPDOSYAVIEW.bk84madde_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('UYAPDOSYAVIEW.bk84madde_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.BK84Madde_Uygulansin')
DBSetProp('UYAPDOSYAVIEW.bk84madde_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for UYAPDOSYAVIEW.bk84madde_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFECDESCRIPT","Bk84madde Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFECFRMCAPTN","Bk84madde Uygulansin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFECDLGCAPTN","Bk84madde Uygulansin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFECGRDCAPTN","Bk84madde Uygulansin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFECRPTCAPTN","Bk84madde Uygulansin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFEMTOOLTIP","Bk84madde Uygulansin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFEMSTATUSTXT","Bk84madde Uygulansin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bk84madde_uygulansin","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the UYAPDOSYAVIEW.bsmv_uygulansin field.
DBSetProp('UYAPDOSYAVIEW.bsmv_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('UYAPDOSYAVIEW.bsmv_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('UYAPDOSYAVIEW.bsmv_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.BSMV_Uygulansin')
DBSetProp('UYAPDOSYAVIEW.bsmv_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for UYAPDOSYAVIEW.bsmv_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFECDESCRIPT","Bsmv Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFECFRMCAPTN","Bsmv Uygulansin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFECDLGCAPTN","Bsmv Uygulansin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFECGRDCAPTN","Bsmv Uygulansin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFECRPTCAPTN","Bsmv Uygulansin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFEMTOOLTIP","Bsmv Uygulansin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFEMSTATUSTXT","Bsmv Uygulansin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.bsmv_uygulansin","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the UYAPDOSYAVIEW.kkdf_uygulansin field.
DBSetProp('UYAPDOSYAVIEW.kkdf_uygulansin', 'Field', 'KeyField', .F.)
DBSetProp('UYAPDOSYAVIEW.kkdf_uygulansin', 'Field', 'Updatable', .T.)
DBSetProp('UYAPDOSYAVIEW.kkdf_uygulansin', 'Field', 'UpdateName', 'dbo.IcraDosya.KKDF_Uygulansin')
DBSetProp('UYAPDOSYAVIEW.kkdf_uygulansin', 'Field', 'DataType', "L")
*** DBCX Field Properties for UYAPDOSYAVIEW.kkdf_uygulansin
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFECDESCRIPT","Kkdf Uygulansin Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFECFRMCAPTN","Kkdf Uygulansin") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFECDLGCAPTN","Kkdf Uygulansin") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFECGRDCAPTN","Kkdf Uygulansin") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFECRPTCAPTN","Kkdf Uygulansin") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFEMTOOLTIP","Kkdf Uygulansin") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFEMSTATUSTXT","Kkdf Uygulansin") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.kkdf_uygulansin","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the UYAPDOSYAVIEW.borclu_adi field.
DBSetProp('UYAPDOSYAVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('UYAPDOSYAVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('UYAPDOSYAVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('UYAPDOSYAVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for UYAPDOSYAVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borclu Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borclu Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borclu Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borclu Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borclu Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borclu Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the UYAPDOSYAVIEW.icradosya_id field.
DBSetProp('UYAPDOSYAVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('UYAPDOSYAVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('UYAPDOSYAVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('UYAPDOSYAVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for UYAPDOSYAVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icradosya Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icradosya Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the UYAPDOSYAVIEW.muvekkil_id field.
DBSetProp('UYAPDOSYAVIEW.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('UYAPDOSYAVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('UYAPDOSYAVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Id')
DBSetProp('UYAPDOSYAVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for UYAPDOSYAVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Muvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Muvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Muvekkil Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Muvekkil Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Muvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!UYAPDOSYAVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
