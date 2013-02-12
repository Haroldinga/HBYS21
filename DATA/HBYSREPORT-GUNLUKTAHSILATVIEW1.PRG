***************** Begin View Definition GUNLUKTAHSILATVIEW ***************


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



CREATE SQL VIEW "GUNLUKTAHSILATVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Tahsilat.Tahsilat_Tarihi,;
		Muvekkil.Muvekkil_Adi,;
		Icradosya.Borc_Tipi,;
		Tahsilat.Tahsilat_Miktari,;
		Tahsilat.Tahsilat_Tipi,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.IcraMudurlugu_Adi,;
		Icradosya.Gelis_Tarihi,;
		Icradosya.Takip_Tarihi,;
		Personel.Is_Unvani,;
		Personel.Personel_Adi;
	FROM {oj dbo.Tahsilat Tahsilat;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Tahsilat.Tahsilat_Fk = Icradosya.IcraDosya_Id;
		LEFT OUTER JOIN dbo.Borclu Borclu;
			ON Tahsilat.Borclu_Id = Borclu.Borclu_Id};
		INNER JOIN dbo.Personel Personel;
			ON Tahsilat.Personel_Id = Personel.Personel_Id;
		INNER JOIN dbo.Muvekkil Muvekkil;
			ON Icradosya.Muvekkil_Id = Muvekkil.Muvekkil_Id;
	ORDER BY Tahsilat.Tahsilat_Tarihi

DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'UpdateType', 1)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'WhereType', 3)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'SendUpdates', .F.)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'MaxRecords', -1)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'Tables', 'dbo.Muvekkil,dbo.Tahsilat,dbo.IcraDosya')
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'Prepared', .F.)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'FetchSize', -1)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'ParameterList', "vp_Tahsilat_Tarihi,'D';vp_Departman_Adi,'V';vp_Is_Unvani,'V';vp_Muvekkil_Id,'V';vp_Borc_Tipi,'V'")
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'Comment', "")
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('GUNLUKTAHSILATVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for GUNLUKTAHSILATVIEW
	GoExplorer.odbcx.Validate("GUNLUKTAHSILATVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW","VIEW",;
		"VFECDESCRIPT","Gunluktahsilatview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Tahsilat_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Tahsilat Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Tahsilat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Tahsilat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECVPTYPE","D") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Tahsilat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Tahsilat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMDEFAULT","Date()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMCOMPARETO","Tahsilat.Tahsilat_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFECOPERATOR","<=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Tahsilat_Tarihi","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Departman_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Departman Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECFRMCAPTN","Departman Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECDLGCAPTN","Departman Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMTOOLTIP","Departman Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Departman Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!departmanlookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLUTAG","departman_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMLUFIELDS","departman_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Departmanlookupview.departman_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Departman_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Is_Unvani
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECDESCRIPT","Vp Is Unvani View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECFRMCAPTN","Ýþ Ünvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECDLGCAPTN","Ýþ Ünvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMTOOLTIP","Ýþ Ünvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMSTATUSTXT","Ýþ Ünvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Is_Unvani","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTAG","muvekkil_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCOMPARETO","IcraDosya.Muvekkil_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
 
	*** DBCX View Parameter Properties for vp_Borc_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Borc Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!borctipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLUTAG","borc_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUFIELDS","borc_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Borctipilookupview.borc_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELOMIT",.T.) &&Always Omit From SQL
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.vp_Borc_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
ENDIF

*!* Field Level Properties for GUNLUKTAHSILATVIEW
*** Props for the GUNLUKTAHSILATVIEW.tahsilat_tarihi field.
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_tarihi', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Tarihi')
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.tahsilat_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECDESCRIPT","Tahsilat Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tarihi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.muvekkil_adi field.
DBSetProp('GUNLUKTAHSILATVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('GUNLUKTAHSILATVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Adi')
DBSetProp('GUNLUKTAHSILATVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.borc_tipi field.
DBSetProp('GUNLUKTAHSILATVIEW.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.borc_tipi', 'Field', 'Updatable', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.borc_tipi', 'Field', 'UpdateName', 'dbo.IcraDosya.Borc_Tipi')
DBSetProp('GUNLUKTAHSILATVIEW.borc_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.borc_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFECDESCRIPT","Borc Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFECFRMCAPTN","Borç Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFECDLGCAPTN","Borç Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFECGRDCAPTN","Borç Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFECRPTCAPTN","Borç Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFEMTOOLTIP","Borç Tipi                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFEMSTATUSTXT","Borç Tipi                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.borc_tipi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.tahsilat_miktari field.
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_miktari', 'Field', 'Updatable', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_miktari', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Miktari')
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_miktari', 'Field', 'DataType', "N(12)")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.tahsilat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECDESCRIPT","Tahsilat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECFRMCAPTN","Tahsilat Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECDLGCAPTN","Tahsilat Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECGRDCAPTN","Tahsilat Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECRPTCAPTN","Tahsilat Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMTOOLTIP","Tahsilat Miktarý                                     ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Miktarý                                     ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_miktari","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.tahsilat_tipi field.
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_tipi', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_tipi', 'Field', 'Updatable', .T.)
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_tipi', 'Field', 'UpdateName', 'dbo.Tahsilat.Tahsilat_Tipi')
DBSetProp('GUNLUKTAHSILATVIEW.tahsilat_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.tahsilat_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECDESCRIPT","Tahsilat Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECFRMCAPTN","Tahsilat Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECDLGCAPTN","Tahsilat Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECGRDCAPTN","Tahsilat Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECRPTCAPTN","Tahsilat Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMTOOLTIP","Tahsilat Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMSTATUSTXT","Tahsilat Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.tahsilat_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.icra_dosya_no field.
DBSetProp('GUNLUKTAHSILATVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.icra_dosya_no', 'Field', 'Updatable', .T.)
DBSetProp('GUNLUKTAHSILATVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('GUNLUKTAHSILATVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Dosya No                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Dosya No                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.icramudurlugu_adi field.
DBSetProp('GUNLUKTAHSILATVIEW.icramudurlugu_adi', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.icramudurlugu_adi', 'Field', 'Updatable', .T.)
DBSetProp('GUNLUKTAHSILATVIEW.icramudurlugu_adi', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraMudurlugu_Adi')
DBSetProp('GUNLUKTAHSILATVIEW.icramudurlugu_adi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.icramudurlugu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFECDESCRIPT","Icramudurlugu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFECFRMCAPTN","Ýcra Müdürlüðü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFECDLGCAPTN","Ýcra Müdürlüðü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFECGRDCAPTN","Ýcra Müdürlüðü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFECRPTCAPTN","Ýcra Müdürlüðü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFEMTOOLTIP","Ýcra Müdürlüðü                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFEMSTATUSTXT","Ýcra Müdürlüðü                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.icramudurlugu_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.gelis_tarihi field.
DBSetProp('GUNLUKTAHSILATVIEW.gelis_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.gelis_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('GUNLUKTAHSILATVIEW.gelis_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Gelis_Tarihi')
DBSetProp('GUNLUKTAHSILATVIEW.gelis_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.gelis_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFECDESCRIPT","Gelis Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFECFRMCAPTN","Dosya Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFECDLGCAPTN","Dosya Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFECGRDCAPTN","Dosya Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFECRPTCAPTN","Dosya Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFEMTOOLTIP","Dosya Tarihi                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFEMSTATUSTXT","Dosya Tarihi                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.gelis_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.takip_tarihi field.
DBSetProp('GUNLUKTAHSILATVIEW.takip_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.takip_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('GUNLUKTAHSILATVIEW.takip_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Takip_Tarihi')
DBSetProp('GUNLUKTAHSILATVIEW.takip_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.takip_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFECDESCRIPT","Takip Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFECFRMCAPTN","Takip Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFECDLGCAPTN","Takip Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFECGRDCAPTN","Takip Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFECRPTCAPTN","Takip Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFEMTOOLTIP","Takip Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFEMSTATUSTXT","Takip Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.takip_tarihi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.is_unvani field.
DBSetProp('GUNLUKTAHSILATVIEW.is_unvani', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.is_unvani', 'Field', 'Updatable', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.is_unvani', 'Field', 'UpdateName', 'dbo.Personel.Is_Unvani')
DBSetProp('GUNLUKTAHSILATVIEW.is_unvani', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.is_unvani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFECDESCRIPT","Is Unvani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFECFRMCAPTN","Ýþ Ünvaný") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFECDLGCAPTN","Ýþ Ünvaný") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFECGRDCAPTN","Ýþ Ünvaný") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFECRPTCAPTN","Ýþ Ünvaný") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFEMTOOLTIP","Ýþ Ünvaný                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFEMSTATUSTXT","Ýþ Ünvaný                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.is_unvani","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the GUNLUKTAHSILATVIEW.personel_adi field.
DBSetProp('GUNLUKTAHSILATVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.personel_adi', 'Field', 'Updatable', .F.)
DBSetProp('GUNLUKTAHSILATVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Personel.Personel_Adi')
DBSetProp('GUNLUKTAHSILATVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for GUNLUKTAHSILATVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSREPORT!GUNLUKTAHSILATVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
