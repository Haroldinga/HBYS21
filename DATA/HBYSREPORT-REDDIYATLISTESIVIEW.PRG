***************** Begin View Definition REDDIYATLISTESIVIEW ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


***Make sure the current database is correct
IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREPORT")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS21\DATA\HBYSREPORT"
ELSE
	SET DATABASE TO "HBYSREPORT"
ENDIF


IF lcSet_Exact='OFF'
	SET EXACT OFF
ENDIF



CREATE SQL VIEW "REDDIYATLISTESIVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Icradosya.Muvekkil_Adi,;
		Icradosya.Dosya_Statusu,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Borc_Tipi,;
		Borclu.Borclu_Adi,;
		Borclu.Urun_No,;
		Tahsilat.Tahsilat_Tipi,;
		Tahsilat.Tahsilat_Miktari,;
		Tahsilat.Tahsilat_Tarihi,;
		Tahsilat.Reddiyat_Miktari,;
		Tahsilat.Reddiyat_Tarihi,;
		Icradosyahesabi.TS_Vekalet_Ucreti,;
		Harc.Harc_Miktari,;
		Personel.Personel_Adi,;
		Personel.Is_Unvani;
	FROM {oj{oj{oj{oj dbo.Tahsilat Tahsilat;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Tahsilat.Tahsilat_Fk = Icradosya.IcraDosya_Id;
		LEFT OUTER JOIN dbo.IcraDosyaHesabi Icradosyahesabi;
			ON Icradosya.IcraDosya_Id = Icradosyahesabi.IcraDosyaHesabi_Fk};
		LEFT OUTER JOIN dbo.Harc Harc;
			ON Icradosya.IcraDosya_Id = Harc.Harc_fk};
		LEFT OUTER JOIN dbo.Personel Personel;
			ON Tahsilat.Personel_Id = Personel.Personel_Id};
		LEFT OUTER JOIN dbo.Borclu Borclu;
			ON Tahsilat.Borclu_Id = Borclu.Borclu_Id};
	ORDER BY Icradosya.Muvekkil_Adi, Tahsilat.Tahsilat_Tarihi

DBSetProp('REDDIYATLISTESIVIEW', 'View', 'UpdateType', 1)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'WhereType', 3)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'MaxRecords', -1)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'Tables', 'dbo.Borclu,dbo.IcraDosya,dbo.Tahsilat,dbo.Personel,dbo.Harc,dbo.IcraDosyaHesabi')
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'Prepared', .F.)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'FetchSize', -1)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'ParameterList', "vp_Basl_Tarihi,'D';vp_Bitis_Tarihi,'D';vp_Muvekkil_Id,'C';vp_Harc_Tipi,'C'")
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'Comment', "")
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('REDDIYATLISTESIVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for REDDIYATLISTESIVIEW
	GoExplorer.odbcx.Validate("REDDIYATLISTESIVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW","VIEW",;
		"VFECDESCRIPT","ReddiyatListesiView Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Basl_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Basl Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Baþlangýç Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Baþlangýç Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Baþlangýç Tarihi                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Baþlangýç Tarihi                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFEMDEFAULT","date()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat.Reddiyat_tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFECOPERATOR",">=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Basl_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Bitis_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Bitis Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Bitiþ Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Bitiþ Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Bitiþ Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Bitiþ Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMDEFAULT","date()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat.Reddiyat_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFECOPERATOR","<=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Bitis_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTAG","muvekkil_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Muvekkil_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Harc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Harc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Harc Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Harc Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Harc Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Harc Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMDEFAULT","[Tahsilat Harc]") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMCOMPARETO","Harc.Harc_Tipi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.vp_Harc_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
ENDIF

*!* Field Level Properties for REDDIYATLISTESIVIEW
*** Props for the REDDIYATLISTESIVIEW.muvekkil_adi field.
DBSetProp('REDDIYATLISTESIVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.muvekkil_adi', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.Muvekkil_Adi')
DBSetProp('REDDIYATLISTESIVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.dosya_statusu field.
DBSetProp('REDDIYATLISTESIVIEW.dosya_statusu', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.dosya_statusu', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.dosya_statusu', 'Field', 'UpdateName', 'dbo.IcraDosya.Dosya_Statusu')
DBSetProp('REDDIYATLISTESIVIEW.dosya_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.dosya_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFECDESCRIPT","Dosya Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFECFRMCAPTN","Dosya Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFECDLGCAPTN","Dosya Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFECGRDCAPTN","Dosya Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFECRPTCAPTN","Dosya Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFEMTOOLTIP","Dosya Statüsü                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFEMSTATUSTXT","Dosya Statüsü                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.dosya_statusu","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.icramudurlugu_adi field.
DBSetProp('REDDIYATLISTESIVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.icramudurlugu_adi', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('REDDIYATLISTESIVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.icra_dosya_no field.
DBSetProp('REDDIYATLISTESIVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('REDDIYATLISTESIVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Dosya No                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Dosya No                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.borc_tipi field.
DBSetProp('REDDIYATLISTESIVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('REDDIYATLISTESIVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.borclu_adi field.
DBSetProp('REDDIYATLISTESIVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.borclu_adi', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Borclu.Borclu_Adi')
DBSetProp('REDDIYATLISTESIVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.urun_no field.
DBSetProp('REDDIYATLISTESIVIEW.urun_no', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.urun_no', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.urun_no', 'Field', 'UpdateName', 'dbo.Borclu.Urun_No')
DBSetProp('REDDIYATLISTESIVIEW.urun_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.urun_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFECDESCRIPT","Urun No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFECFRMCAPTN","Ürün No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFECDLGCAPTN","Ürün No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFECGRDCAPTN","Ürün No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFECRPTCAPTN","Ürün No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFEMTOOLTIP","Ürün No                                              ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFEMSTATUSTXT","Ürün No                                              ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.urun_no","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.tahsilat_tipi field.
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_tipi', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_tipi', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_tipi', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Tipi')
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.tahsilat_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFECDESCRIPT","Tahsilat Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tipi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.tahsilat_miktari field.
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_miktari', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_miktari', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Miktari')
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.tahsilat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFECDESCRIPT","Tahsilat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFECFRMCAPTN","Tahsilat Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFECDLGCAPTN","Tahsilat Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFECGRDCAPTN","Tahsilat Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFECRPTCAPTN","Tahsilat Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFEMTOOLTIP","Tahsilat Miktarý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Miktarý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_miktari","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.tahsilat_tarihi field.
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_tarihi', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Tarihi')
DBSetProp('REDDIYATLISTESIVIEW.tahsilat_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.tahsilat_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFECDESCRIPT","Tahsilat Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.tahsilat_tarihi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.reddiyat_miktari field.
DBSetProp('REDDIYATLISTESIVIEW.reddiyat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.reddiyat_miktari', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.reddiyat_miktari', 'Field', 'UpdateName', 'dbo.Tahsilat.Reddiyat_Miktari')
DBSetProp('REDDIYATLISTESIVIEW.reddiyat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.reddiyat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFECDESCRIPT","Reddiyat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFECFRMCAPTN","Reddiyat Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFECDLGCAPTN","Reddiyat Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFECGRDCAPTN","Reddiyat Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFECRPTCAPTN","Reddiyat Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFEMTOOLTIP","Reddiyat Miktarý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFEMSTATUSTXT","Reddiyat Miktarý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_miktari","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.reddiyat_tarihi field.
DBSetProp('REDDIYATLISTESIVIEW.reddiyat_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.reddiyat_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.reddiyat_tarihi', 'Field', 'UpdateName', 'dbo.Tahsilat.Reddiyat_Tarihi')
DBSetProp('REDDIYATLISTESIVIEW.reddiyat_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.reddiyat_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFECDESCRIPT","Reddiyat Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFECFRMCAPTN","Reddiyat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFECDLGCAPTN","Reddiyat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFECGRDCAPTN","Reddiyat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFECRPTCAPTN","Reddiyat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFEMTOOLTIP","Reddiyat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFEMSTATUSTXT","Reddiyat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.reddiyat_tarihi","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.ts_vekalet_ucreti field.
DBSetProp('REDDIYATLISTESIVIEW.ts_vekalet_ucreti', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.ts_vekalet_ucreti', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.ts_vekalet_ucreti', 'Field', 'UpdateName', 'dbo.IcraDosyaHesabi.TS_Vekalet_Ucreti')
DBSetProp('REDDIYATLISTESIVIEW.ts_vekalet_ucreti', 'Field', 'DataType', "Y")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.ts_vekalet_ucreti
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECDESCRIPT","Ts Vekalet Ucreti Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECFRMCAPTN","Vekalet Ücreti") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECDLGCAPTN","Vekalet Ücreti") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECGRDCAPTN","Vekalet Ücreti") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECRPTCAPTN","Vekalet Ücreti") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMTOOLTIP","Vekalet Ücreti                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMSTATUSTXT","Vekalet Ücreti                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.ts_vekalet_ucreti","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.harc_miktari field.
DBSetProp('REDDIYATLISTESIVIEW.harc_miktari', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.harc_miktari', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.harc_miktari', 'Field', 'UpdateName', 'dbo.Harc.Harc_Miktari')
DBSetProp('REDDIYATLISTESIVIEW.harc_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.harc_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFECDESCRIPT","Harc Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFECFRMCAPTN","Tahsilat Harcý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFECDLGCAPTN","Tahsilat Harcý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFECGRDCAPTN","Tahsilat Harcý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFECRPTCAPTN","Tahsilat Harcý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFEMTOOLTIP","Tahsilat Harcý                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Harcý                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.harc_miktari","FIELD",;
		"VFENDISPORDER",12) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.personel_adi field.
DBSetProp('REDDIYATLISTESIVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.personel_adi', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('REDDIYATLISTESIVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the REDDIYATLISTESIVIEW.is_unvani field.
DBSetProp('REDDIYATLISTESIVIEW.is_unvani', 'Field', 'KeyField', .F.)
DBSetProp('REDDIYATLISTESIVIEW.is_unvani', 'Field', 'Updatable', .F.)
DBSetProp('REDDIYATLISTESIVIEW.is_unvani', 'Field', 'UpdateName', 'dbo.Personel.Is_Unvani')
DBSetProp('REDDIYATLISTESIVIEW.is_unvani', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for REDDIYATLISTESIVIEW.is_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFECDESCRIPT","Is Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFECFRMCAPTN","Ýþ Ünvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFECDLGCAPTN","Ýþ Ünvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFECGRDCAPTN","Ýþ Ünvaný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFECRPTCAPTN","Ýþ Ünvaný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFEMTOOLTIP","Ýþ Ünvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFEMSTATUSTXT","Ýþ Ünvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!REDDIYATLISTESIVIEW.is_unvani","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
