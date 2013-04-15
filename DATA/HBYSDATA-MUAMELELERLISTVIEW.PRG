***************** Begin View Definition MUAMELELERLISTVIEW ***************


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



CREATE SQL VIEW "MUAMELELERLISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Muamele.Muamele_Id,;
		Muamele.Muamele_Fk,;
		Muamele.Borclu_Id,;
		Muamele.Borclu_Adi,;
		Muamele.Rehber_Id,;
		Muamele.Muamele_Tarihi,;
		Muamele.Muzekkere_Adi,;
		Muamele.Talep_Ifadesi,;
		Muamele.Masraf_Tipi,;
		Muamele.Masraf_Miktari,;
		Muamele.Mal_Tipi,;
		Muamele.Mal_Bilgisi,;
		Muamele.Muhatap_Adi,;
		Muamele.Muhatap_Adresi,;
		Muamele.Haciz_Tarihi,;
		Muamele.Maas_Muvafakat_Miktari,;
		Muamele.Muamele_Statusu,;
		Muamele.Personel_Id,;
		Muamele.Personel_Adi,;
		Icradosya.IcraDosya_Id,;
		Icradosya.Icra_Dosya_No,;
		Icradosya.Buro_Dosya_No,;
		Icradosya.Hitam_Tarihi,;
		Icradosya.Itiraz_Edildi,;
		Icradosya.Bila_Tarihi,;
		Icradosya.Kesinlesme_Tarihi,;
		CAST('' AS VARCHAR(250)) AS borclu_adresi,;
		CAST(1 AS BIT) AS lmuzekkerebas;
	FROM dbo.Muamele Muamele;
		INNER JOIN dbo.IcraDosya Icradosya;
			ON Muamele.Muamele_Fk = Icradosya.IcraDosya_Id

DBSetProp('MUAMELELERLISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'WhereType', 3)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'Tables', 'dbo.Muamele')
DBSetProp('MUAMELELERLISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'ParameterList', "vp_Icra_Dosya_No,'V';vp_Buro_Dosya_No,'V';vp_Muamele_Tarihi1,'T';vp_Muamele_Tarihi2,'T';vp_Muzekkere_Adi,'C';vp_Personel_Id,'C'")
DBSetProp('MUAMELELERLISTVIEW', 'View', 'Comment', "")
DBSetProp('MUAMELELERLISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUAMELELERLISTVIEW', 'View', 'ShareConnection', .T.)

_VFEGenView_F1()

IF lWriteDBCXProps
 
	*** DBCX View Properties for MUAMELELERLISTVIEW
	GoExplorer.odbcx.Validate("MUAMELELERLISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW","VIEW",;
		"VFECDESCRIPT","MUAMELELERLISTVIEW Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Icra_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Icra Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\adata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Icra_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","RTrim(Icradosya.Icra_dosya_no) IN ?.vp_Icra_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Buro_Dosya_No
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Dosya No View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECFRMCAPTN","Semiramis No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECDLGCAPTN","Semiramis No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECVPTYPE","V") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFENVPSIZE",4) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMTOOLTIP","Semiramis No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMSTATUSTXT","Semiramis No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECCLASS","adynamicviewparametersupportinginadnbetweenclause") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMDEFAULT","space(500)") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFECOPERATOR","=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Buro_Dosya_No","PARAMETER",;
		"VFEMWHEREEXPR","RTrim(Icradosya.Buro_dosya_no) IN ?.vp_Buro_Dosya_No") &&Complete SQL Where Expression
 
	*** DBCX View Parameter Properties for vp_Muamele_Tarihi1
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Tarihi1 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFECFRMCAPTN","Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFECDLGCAPTN","Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFECVPTYPE","T") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFENVPSIZE",20) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFEMTOOLTIP","Muamele Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Muamele_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFECOPERATOR",">=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi1","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muamele_Tarihi2
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFECDESCRIPT","Vp Muamele Tarihi2 View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFECFRMCAPTN","Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFECDLGCAPTN","Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFECVPTYPE","T") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFENVPSIZE",20) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFEMTOOLTIP","Muamele Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFEMSTATUSTXT","Muamele Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFEMDEFAULT","DateTime()") &&Default Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Muamele_Tarihi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFECOPERATOR","<=") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muamele_Tarihi2","PARAMETER",;
		"VFEMOPERLIST","=, >, <, >=, <=") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muzekkere_Adi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECDESCRIPT","Vp Muzekkere Adi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECFRMCAPTN","Müzekkere Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECDLGCAPTN","Müzekkere Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFENVPSIZE",50) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMTOOLTIP","Müzekkere Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMSTATUSTXT","Müzekkere Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECLUTABLE","hbysdata!muzekkeretipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECLUTAG","rapor_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMLUFIELDS","rapor_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMLUUPDTEXP","Muzekkeretipilookupview.rapor_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Muzekkere_Adi") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Muzekkere_Adi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Personel_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Personel Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMCOMPARETO","Muamele.Personel_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.vp_Personel_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!muamelelerlistview.icradosyno
	GoExplorer.odbcx.AddViewIndex("hbysdata!muamelelerlistview","icradosyno","ICRA_DOSYA_NO","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.icradosyno","INDEX",;
		"VFECDESCRIPT","Icradosyno Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.icradosyno","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.icradosyno","INDEX",;
		"VFECTAGCAPTN","Icradosyno") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.icradosyno","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysdata!muamelelerlistview.burodosyno
	GoExplorer.odbcx.AddViewIndex("hbysdata!muamelelerlistview","burodosyno","BURO_DOSYA_NO","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.burodosyno","INDEX",;
		"VFECDESCRIPT","Burodosyno Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.burodosyno","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.burodosyno","INDEX",;
		"VFECTAGCAPTN","Burodosyno") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.burodosyno","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysdata!muamelelerlistview.muamltarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!muamelelerlistview","muamltarh","MUAMELE_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muamltarh","INDEX",;
		"VFECDESCRIPT","Muamltarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muamltarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muamltarh","INDEX",;
		"VFECTAGCAPTN","Muamltarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muamltarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysdata!muamelelerlistview.borcluadi
	GoExplorer.odbcx.AddViewIndex("hbysdata!muamelelerlistview","borcluadi","BORCLU_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.borcluadi","INDEX",;
		"VFECDESCRIPT","Borcluadi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.borcluadi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.borcluadi","INDEX",;
		"VFECTAGCAPTN","Borcluadi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.borcluadi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysdata!muamelelerlistview.muzekradi
	GoExplorer.odbcx.AddViewIndex("hbysdata!muamelelerlistview","muzekradi","MUZEKKERE_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muzekradi","INDEX",;
		"VFECDESCRIPT","Muzekradi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muzekradi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muzekradi","INDEX",;
		"VFECTAGCAPTN","Muzekradi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muzekradi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
 
	*** DBCX Index Properties for hbysdata!muamelelerlistview.muhatapadi
	GoExplorer.odbcx.AddViewIndex("hbysdata!muamelelerlistview","muhatapadi","MUHATAP_ADI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muhatapadi","INDEX",;
		"VFECDESCRIPT","Muhatapadi Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muhatapadi","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muhatapadi","INDEX",;
		"VFECTAGCAPTN","Muhatapadi") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!muamelelerlistview.muhatapadi","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for MUAMELELERLISTVIEW
*** Props for the MUAMELELERLISTVIEW.muamele_id field.
DBSetProp('MUAMELELERLISTVIEW.muamele_id', 'Field', 'KeyField', .T.)
DBSetProp('MUAMELELERLISTVIEW.muamele_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.muamele_id', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Id')
DBSetProp('MUAMELELERLISTVIEW.muamele_id', 'Field', 'DataType', "C(36)")
DBSetProp('MUAMELELERLISTVIEW.muamele_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.muamele_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFECDESCRIPT","Muamele Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFECFRMCAPTN","Muamele ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFECDLGCAPTN","Muamele ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFECGRDCAPTN","Muamele ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFECRPTCAPTN","Muamele ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFEMTOOLTIP","Muamele ID                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFEMSTATUSTXT","Muamele ID                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.muamele_fk field.
DBSetProp('MUAMELELERLISTVIEW.muamele_fk', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.muamele_fk', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.muamele_fk', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Fk')
DBSetProp('MUAMELELERLISTVIEW.muamele_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.muamele_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFECDESCRIPT","Muamele Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFECFRMCAPTN","Muamele FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFECDLGCAPTN","Muamele FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFECGRDCAPTN","Muamele FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFECRPTCAPTN","Muamele FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFEMTOOLTIP","Muamele FK                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFEMSTATUSTXT","Muamele FK                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFECCLASS","ifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\idata.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.borclu_id field.
DBSetProp('MUAMELELERLISTVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.Muamele.Borclu_Id')
DBSetProp('MUAMELELERLISTVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECLUTAG","borclu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_id","FIELD",;
		"VFEMLUUPDFLDS","borclu_adi, rehber_id, borclu_adresi") &&After Lookup Update Field List
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.borclu_adi field.
DBSetProp('MUAMELELERLISTVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Muamele.Borclu_Adi')
DBSetProp('MUAMELELERLISTVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFECQFINDTAG","borcluadi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.rehber_id field.
DBSetProp('MUAMELELERLISTVIEW.rehber_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.rehber_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.rehber_id', 'Field', 'UpdateName', 'dbo.Muamele.Rehber_Id')
DBSetProp('MUAMELELERLISTVIEW.rehber_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.rehber_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFECDESCRIPT","Rehber Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFECFRMCAPTN","Rehber Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFECDLGCAPTN","Rehber Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFECGRDCAPTN","Rehber Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFECRPTCAPTN","Rehber Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFEMTOOLTIP","Rehber Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFEMSTATUSTXT","Rehber Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.rehber_id","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.muamele_tarihi field.
DBSetProp('MUAMELELERLISTVIEW.muamele_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.muamele_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.muamele_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Tarihi')
DBSetProp('MUAMELELERLISTVIEW.muamele_tarihi', 'Field', 'DataType', "T")
DBSetProp('MUAMELELERLISTVIEW.muamele_tarihi', 'Field', 'DefaultValue', "dateTime()")
*** DBCX Field Properties for MUAMELELERLISTVIEW.muamele_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFECDESCRIPT","Muamele Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFECFRMCAPTN","Muamele Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFECDLGCAPTN","Muamele Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFECGRDCAPTN","Muamele Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFECRPTCAPTN","Muamele Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFEMTOOLTIP","Muamele Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFEMSTATUSTXT","Muamele Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFECQFINDTAG","muamltarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_tarihi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.muzekkere_adi field.
DBSetProp('MUAMELELERLISTVIEW.muzekkere_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.muzekkere_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.muzekkere_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muzekkere_Adi')
DBSetProp('MUAMELELERLISTVIEW.muzekkere_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.muzekkere_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECDESCRIPT","Muzekkere Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECFRMCAPTN","Müzekkere Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECDLGCAPTN","Müzekkere Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECGRDCAPTN","Müzekkere Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECRPTCAPTN","Müzekkere Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFEMTOOLTIP","Müzekkere Adý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFEMSTATUSTXT","Müzekkere Adý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECLUTABLE","hbysdata!muameletipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECLUTAG","rapor_adi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFEMLUFIELDS","rapor_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFEMLUUPDTEXP","Muameletipilookupview.rapor_adi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECCLASS","muzekkereadifield") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFECQFINDTAG","muzekradi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muzekkere_adi","FIELD",;
		"VFEMLUUPDFLDS","talep_ifadesi") &&After Lookup Update Field List
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.talep_ifadesi field.
DBSetProp('MUAMELELERLISTVIEW.talep_ifadesi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.talep_ifadesi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.talep_ifadesi', 'Field', 'UpdateName', 'dbo.Muamele.Talep_Ifadesi')
DBSetProp('MUAMELELERLISTVIEW.talep_ifadesi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.talep_ifadesi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFECDESCRIPT","Talep Ifadesi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFECFRMCAPTN","Talep Ýfadesi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFECDLGCAPTN","Talep Ýfadesi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFECGRDCAPTN","Talep Ýfadesi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFECRPTCAPTN","Talep Ýfadesi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFEMTOOLTIP","Talep Ýfadesi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFEMSTATUSTXT","Talep Ýfadesi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.talep_ifadesi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.masraf_tipi field.
DBSetProp('MUAMELELERLISTVIEW.masraf_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.masraf_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.masraf_tipi', 'Field', 'UpdateName', 'dbo.Muamele.Masraf_Tipi')
DBSetProp('MUAMELELERLISTVIEW.masraf_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.masraf_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECDESCRIPT","Masraf Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECFRMCAPTN","Masraf Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECDLGCAPTN","Masraf Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECGRDCAPTN","Masraf Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECRPTCAPTN","Masraf Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFEMTOOLTIP","Masraf Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFEMSTATUSTXT","Masraf Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!masraftipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECLUTAG","masraf_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFEMLUFIELDS","masraf_tipi, masraf_miktari") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFEMLUUPDTEXP","Masraftipilookupview.masraf_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECCLASS","afieldnovalidateduringsave") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFEMCLASSLIB","libs\abhavior.vcx") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_tipi","FIELD",;
		"VFEMLUUPDFLDS","masraf_miktari") &&After Lookup Update Field List
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.masraf_miktari field.
DBSetProp('MUAMELELERLISTVIEW.masraf_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.masraf_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.masraf_miktari', 'Field', 'UpdateName', 'dbo.Muamele.Masraf_Miktari')
DBSetProp('MUAMELELERLISTVIEW.masraf_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MUAMELELERLISTVIEW.masraf_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFECDESCRIPT","Masraf Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFECFRMCAPTN","Masraf Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFECDLGCAPTN","Masraf Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFECGRDCAPTN","Masraf Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFECRPTCAPTN","Masraf Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFEMTOOLTIP","Masraf Miktarý                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFEMSTATUSTXT","Masraf Miktarý                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.masraf_miktari","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.mal_tipi field.
DBSetProp('MUAMELELERLISTVIEW.mal_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.mal_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.mal_tipi', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Tipi')
DBSetProp('MUAMELELERLISTVIEW.mal_tipi', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.mal_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECDESCRIPT","Mal Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECFRMCAPTN","Mal Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECDLGCAPTN","Mal Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECGRDCAPTN","Mal Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECRPTCAPTN","Mal Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFEMTOOLTIP","Mal Tipi                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFEMSTATUSTXT","Mal Tipi                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECLUTABLE","hbysdata!maltipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECLUTAG","mal_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFEMLUFIELDS","mal_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFEMLUUPDTEXP","Maltipilookupview.mal_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_tipi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.mal_bilgisi field.
DBSetProp('MUAMELELERLISTVIEW.mal_bilgisi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.mal_bilgisi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.mal_bilgisi', 'Field', 'UpdateName', 'dbo.Muamele.Mal_Bilgisi')
DBSetProp('MUAMELELERLISTVIEW.mal_bilgisi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.mal_bilgisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFECDESCRIPT","Mal Bilgisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFECFRMCAPTN","Mal Bilgisi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFECDLGCAPTN","Mal Bilgisi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFECGRDCAPTN","Mal Bilgisi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFECRPTCAPTN","Mal Bilgisi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFEMTOOLTIP","Mal Bilgisi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFEMSTATUSTXT","Mal Bilgisi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.mal_bilgisi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.muhatap_adi field.
DBSetProp('MUAMELELERLISTVIEW.muhatap_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.muhatap_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.muhatap_adi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adi')
DBSetProp('MUAMELELERLISTVIEW.muhatap_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.muhatap_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFECDESCRIPT","Muhatap Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adý                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adý                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFECQFINDTAG","muhatapadi") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adi","FIELD",;
		"VFENDISPORDER",14) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.muhatap_adresi field.
DBSetProp('MUAMELELERLISTVIEW.muhatap_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.muhatap_adresi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.muhatap_adresi', 'Field', 'UpdateName', 'dbo.Muamele.Muhatap_Adresi')
DBSetProp('MUAMELELERLISTVIEW.muhatap_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.muhatap_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFECDESCRIPT","Muhatap Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFECFRMCAPTN","Muhatap Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFECDLGCAPTN","Muhatap Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFECGRDCAPTN","Muhatap Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFECRPTCAPTN","Muhatap Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFEMTOOLTIP","Muhatap Adresi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFEMSTATUSTXT","Muhatap Adresi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muhatap_adresi","FIELD",;
		"VFENDISPORDER",15) &&Display Order
ENDIF
 


***Split to stay below 64K limit***
FUNCTION _VFEGenView_F1
*** Props for the MUAMELELERLISTVIEW.haciz_tarihi field.
DBSetProp('MUAMELELERLISTVIEW.haciz_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.haciz_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.haciz_tarihi', 'Field', 'UpdateName', 'dbo.Muamele.Haciz_Tarihi')
DBSetProp('MUAMELELERLISTVIEW.haciz_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUAMELELERLISTVIEW.haciz_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFECDESCRIPT","Haciz Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFECFRMCAPTN","Haciz Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFECDLGCAPTN","Haciz Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFECGRDCAPTN","Haciz Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFECRPTCAPTN","Haciz Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFEMTOOLTIP","Haciz Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFEMSTATUSTXT","Haciz Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\idatetimecontrols.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.haciz_tarihi","FIELD",;
		"VFENDISPORDER",16) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.maas_muvafakat_miktari field.
DBSetProp('MUAMELELERLISTVIEW.maas_muvafakat_miktari', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.maas_muvafakat_miktari', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.maas_muvafakat_miktari', 'Field', 'UpdateName', 'dbo.Muamele.Maas_Muvafakat_Miktari')
DBSetProp('MUAMELELERLISTVIEW.maas_muvafakat_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for MUAMELELERLISTVIEW.maas_muvafakat_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDESCRIPT","Maas Muvafakat Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECFRMCAPTN","Maaþ Muvafakat") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECDLGCAPTN","Maaþ Muvafakat") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECGRDCAPTN","Maaþ Muvafakat") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECRPTCAPTN","Maaþ Muvafakat") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMTOOLTIP","Maaþ Muvafakat                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMSTATUSTXT","Maaþ Muvafakat                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFENDISPORDER",17) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.maas_muvafakat_miktari","FIELD",;
		"VFEMFORMAT","KZ") &&Format
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.muamele_statusu field.
DBSetProp('MUAMELELERLISTVIEW.muamele_statusu', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.muamele_statusu', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.muamele_statusu', 'Field', 'UpdateName', 'dbo.Muamele.Muamele_Statusu')
DBSetProp('MUAMELELERLISTVIEW.muamele_statusu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.muamele_statusu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFECDESCRIPT","Muamele Statusu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFECFRMCAPTN","Muamele Statüsü") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFECDLGCAPTN","Muamele Statüsü") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFECGRDCAPTN","Muamele Statüsü") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFECRPTCAPTN","Muamele Statüsü") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFEMTOOLTIP","Muamele Statüsü                                      ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFEMSTATUSTXT","Muamele Statüsü                                      ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.muamele_statusu","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.personel_id field.
DBSetProp('MUAMELELERLISTVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Muamele.Personel_Id')
DBSetProp('MUAMELELERLISTVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFENDISPORDER",10) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_id","FIELD",;
		"VFEMLUUPDFLDS","personel_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.personel_adi field.
DBSetProp('MUAMELELERLISTVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUAMELELERLISTVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Muamele.Personel_Adi')
DBSetProp('MUAMELELERLISTVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",11) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.icradosya_id field.
DBSetProp('MUAMELELERLISTVIEW.icradosya_id', 'Field', 'KeyField', .T.)
DBSetProp('MUAMELELERLISTVIEW.icradosya_id', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELELERLISTVIEW.icradosya_id', 'Field', 'UpdateName', 'dbo.IcraDosya.IcraDosya_Id')
DBSetProp('MUAMELELERLISTVIEW.icradosya_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.icradosya_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFECDESCRIPT","Icradosya Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFECFRMCAPTN","Icra Dosya ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFECDLGCAPTN","Icra Dosya ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFECGRDCAPTN","Icra Dosya ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFECRPTCAPTN","Icra Dosya ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFEMTOOLTIP","Icra Dosya ID                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFEMSTATUSTXT","Icra Dosya ID                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icradosya_id","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.icra_dosya_no field.
DBSetProp('MUAMELELERLISTVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELELERLISTVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('MUAMELELERLISTVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra  Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra  Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra  Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra  Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra  Dosya No                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra  Dosya No                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFECQFINDTAG","icradosyno") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",20) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.buro_dosya_no field.
DBSetProp('MUAMELELERLISTVIEW.buro_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.buro_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELELERLISTVIEW.buro_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Buro_Dosya_No')
DBSetProp('MUAMELELERLISTVIEW.buro_dosya_no', 'Field', 'DataType', "I")
*** DBCX Field Properties for MUAMELELERLISTVIEW.buro_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFECDESCRIPT","Buro Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFECFRMCAPTN","Büro Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFECDLGCAPTN","Büro Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFECGRDCAPTN","Büro Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFECRPTCAPTN","Büro Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFEMTOOLTIP","Büro Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Büro Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFECQFINDTAG","burodosyno") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.buro_dosya_no","FIELD",;
		"VFENDISPORDER",19) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.hitam_tarihi field.
DBSetProp('MUAMELELERLISTVIEW.hitam_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.hitam_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELELERLISTVIEW.hitam_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Hitam_Tarihi')
DBSetProp('MUAMELELERLISTVIEW.hitam_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for MUAMELELERLISTVIEW.hitam_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFECDESCRIPT","Hitam Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFECFRMCAPTN","Hitam Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFECDLGCAPTN","Hitam Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFECGRDCAPTN","Hitam Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFECRPTCAPTN","Hitam Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFEMTOOLTIP","Hitam Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFEMSTATUSTXT","Hitam Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.hitam_tarihi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.itiraz_edildi field.
DBSetProp('MUAMELELERLISTVIEW.itiraz_edildi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.itiraz_edildi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELELERLISTVIEW.itiraz_edildi', 'Field', 'UpdateName', 'dbo.IcraDosya.Itiraz_Edildi')
DBSetProp('MUAMELELERLISTVIEW.itiraz_edildi', 'Field', 'DataType', "L")
*** DBCX Field Properties for MUAMELELERLISTVIEW.itiraz_edildi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFECDESCRIPT","Itiraz Edildi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFECFRMCAPTN","Ýtiraz Edildi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFECDLGCAPTN","Ýtiraz Edildi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFECGRDCAPTN","Ýtiraz Edildi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFECRPTCAPTN","Ýtiraz Edildi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFEMTOOLTIP","Ýtiraz Edildi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFEMSTATUSTXT","Ýtiraz Edildi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.itiraz_edildi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.bila_tarihi field.
DBSetProp('MUAMELELERLISTVIEW.bila_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.bila_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELELERLISTVIEW.bila_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Bila_Tarihi')
DBSetProp('MUAMELELERLISTVIEW.bila_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for MUAMELELERLISTVIEW.bila_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFECDESCRIPT","Bila Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFECFRMCAPTN","Bila Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFECDLGCAPTN","Bila Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFECGRDCAPTN","Bila Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFECRPTCAPTN","Bila Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFEMTOOLTIP","Bila Tarihi                                          ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFEMSTATUSTXT","Bila Tarihi                                          ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.bila_tarihi","FIELD",;
		"VFENDISPORDER",8) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.kesinlesme_tarihi field.
DBSetProp('MUAMELELERLISTVIEW.kesinlesme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.kesinlesme_tarihi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELELERLISTVIEW.kesinlesme_tarihi', 'Field', 'UpdateName', 'dbo.IcraDosya.Kesinlesme_Tarihi')
DBSetProp('MUAMELELERLISTVIEW.kesinlesme_tarihi', 'Field', 'DataType', "T")
*** DBCX Field Properties for MUAMELELERLISTVIEW.kesinlesme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFECDESCRIPT","Kesinlesme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFECFRMCAPTN","Kesinleþme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFECDLGCAPTN","Kesinleþme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFECGRDCAPTN","Kesinleþme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFECRPTCAPTN","Kesinleþme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMTOOLTIP","Kesinleþme Tarihi                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Kesinleþme Tarihi                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.kesinlesme_tarihi","FIELD",;
		"VFENDISPORDER",9) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.borclu_adresi field.
DBSetProp('MUAMELELERLISTVIEW.borclu_adresi', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.borclu_adresi', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELELERLISTVIEW.borclu_adresi', 'Field', 'UpdateName', 'borclu_adresi')
DBSetProp('MUAMELELERLISTVIEW.borclu_adresi', 'Field', 'DataType', "C(250)")
*** DBCX Field Properties for MUAMELELERLISTVIEW.borclu_adresi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"CBMNOTES","Borçlu bilgisi girilince, bu alan da seçiliyor, bu alan daha sonra muhatap bilgilerini bulmakta kullanýlýyor") &&Notes
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFECDESCRIPT","Borclu Adresi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adresi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adresi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adresi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adresi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adresi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adresi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.borclu_adresi","FIELD",;
		"VFENDISPORDER",21) &&Display Order
ENDIF
 
*** Props for the MUAMELELERLISTVIEW.lmuzekkerebas field.
DBSetProp('MUAMELELERLISTVIEW.lmuzekkerebas', 'Field', 'KeyField', .F.)
DBSetProp('MUAMELELERLISTVIEW.lmuzekkerebas', 'Field', 'Updatable', .F.)
DBSetProp('MUAMELELERLISTVIEW.lmuzekkerebas', 'Field', 'UpdateName', 'lMuzekkereBas')
DBSetProp('MUAMELELERLISTVIEW.lmuzekkerebas', 'Field', 'DataType', "L")
*** DBCX Field Properties for MUAMELELERLISTVIEW.lmuzekkerebas
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFECDESCRIPT","Lmuzekkerebas Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFECFRMCAPTN","Müzekkere Bas") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFECDLGCAPTN","Müzekkere Bas") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFECGRDCAPTN","Müzekkere Bas") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFECRPTCAPTN","Müzekkere Bas") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFEMTOOLTIP","Müzekkere Bas                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFEMSTATUSTXT","Müzekkere Bas                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFECOBJTYPE","icheckbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUAMELELERLISTVIEW.lmuzekkerebas","FIELD",;
		"VFENDISPORDER",24) &&Display Order
ENDIF
 
