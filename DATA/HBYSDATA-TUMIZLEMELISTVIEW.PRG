***************** Begin View Definition TUMIZLEMELISTVIEW ***************


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



CREATE SQL VIEW "TUMIZLEMELISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Izleme.Izleme_Id,;
		Izleme.Izleme_Fk,;
		Izleme.Borclu_Id,;
		Izleme.Borclu_Adi,;
		Izleme.Izleme_Tarihi,;
		Izleme.Izleme_Sonucu,;
		Izleme.Odeme_Sozu_Tarihi,;
		Izleme.Odeme_Sozu_Miktari,;
		Izleme.Aciklama,;
		Izleme.Personel_Id,;
		Izleme.Personel_Adi,;
		Izleme.Aciklama AS aciklama1,;
		Icradosya.Icra_Dosya_No;
	FROM {oj dbo.Izleme Izleme;
		LEFT OUTER JOIN dbo.IcraDosya Icradosya;
			ON Izleme.Izleme_Fk = Icradosya.IcraDosya_Id};
	WHERE Izleme.Izleme_Fk IN (Select DISTINCT Borclu.Borclu_Fk;
	FROM dbo.Borclu Borclu;
	WHERE Borclu.Rehber_Id In (Select Borclu2.Rehber_Id;
	FROM dbo.Borclu Borclu2;
	WHERE Borclu2.Borclu_Fk = ?vp_IcraDosya_Id))

DBSetProp('TUMIZLEMELISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'WhereType', 3)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'Tables', 'dbo.Izleme')
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'ParameterList', "vp_IcraDosya_Id,'C'")
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'Comment', "")
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('TUMIZLEMELISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for TUMIZLEMELISTVIEW
	GoExplorer.odbcx.Validate("TUMIZLEMELISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW","VIEW",;
		"VFECDESCRIPT","Tumizlemelistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_IcraDosya_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Icradosya Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECFRMCAPTN","Icradosya Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECDLGCAPTN","Icradosya Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFENVPSIZE",10) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMTOOLTIP","Icradosya Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMSTATUSTXT","Icradosya Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECCLASS","iViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELFKPARAM",.T.) &&Auto Foreign Key
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.vp_IcraDosya_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!tumizlemelistview.izlmtarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!tumizlemelistview","izlmtarh","IZLEME_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!tumizlemelistview.izlmtarh","INDEX",;
		"VFECDESCRIPT","Izlmtarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!tumizlemelistview.izlmtarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!tumizlemelistview.izlmtarh","INDEX",;
		"VFECTAGCAPTN","Izlmtarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!tumizlemelistview.izlmtarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for TUMIZLEMELISTVIEW
*** Props for the TUMIZLEMELISTVIEW.izleme_id field.
DBSetProp('TUMIZLEMELISTVIEW.izleme_id', 'Field', 'KeyField', .T.)
DBSetProp('TUMIZLEMELISTVIEW.izleme_id', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.izleme_id', 'Field', 'UpdateName', 'dbo.Izleme.Izleme_Id')
DBSetProp('TUMIZLEMELISTVIEW.izleme_id', 'Field', 'DataType', "C(36)")
DBSetProp('TUMIZLEMELISTVIEW.izleme_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.izleme_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFECDESCRIPT","Izleme Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFECFRMCAPTN","Ýzleme ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFECDLGCAPTN","Ýzleme ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFECGRDCAPTN","Ýzleme ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFECRPTCAPTN","Ýzleme ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFEMTOOLTIP","Ýzleme ID                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFEMSTATUSTXT","Ýzleme ID                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.izleme_fk field.
DBSetProp('TUMIZLEMELISTVIEW.izleme_fk', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.izleme_fk', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.izleme_fk', 'Field', 'UpdateName', 'dbo.Izleme.Izleme_Fk')
DBSetProp('TUMIZLEMELISTVIEW.izleme_fk', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.izleme_fk
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFECDESCRIPT","Izleme Fk Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFECFRMCAPTN","Ýzleme FK") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFECDLGCAPTN","Ýzleme FK") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFECGRDCAPTN","Ýzleme FK") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFECRPTCAPTN","Ýzleme FK") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFEMTOOLTIP","Ýzleme FK                                            ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFEMSTATUSTXT","Ýzleme FK                                            ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_fk","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.borclu_id field.
DBSetProp('TUMIZLEMELISTVIEW.borclu_id', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.borclu_id', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.borclu_id', 'Field', 'UpdateName', 'dbo.Izleme.Borclu_Id')
DBSetProp('TUMIZLEMELISTVIEW.borclu_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.borclu_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECDESCRIPT","Borclu Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECLUTABLE","hbysdata!borclulookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECLUTAG","borclu_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFEMLUFIELDS","borclu_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFEMLUUPDTEXP","Borclulookupview.borclu_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_id","FIELD",;
		"VFEMLUUPDFLDS","borclu_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.borclu_adi field.
DBSetProp('TUMIZLEMELISTVIEW.borclu_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.borclu_adi', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.borclu_adi', 'Field', 'UpdateName', 'dbo.Izleme.Borclu_Adi')
DBSetProp('TUMIZLEMELISTVIEW.borclu_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.borclu_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFECDESCRIPT","Borclu Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFECFRMCAPTN","Borçlu Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFECDLGCAPTN","Borçlu Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFECGRDCAPTN","Borçlu Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFECRPTCAPTN","Borçlu Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFEMTOOLTIP","Borçlu Adý                                           ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFEMSTATUSTXT","Borçlu Adý                                           ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.borclu_adi","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.izleme_tarihi field.
DBSetProp('TUMIZLEMELISTVIEW.izleme_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.izleme_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.izleme_tarihi', 'Field', 'UpdateName', 'dbo.Izleme.Izleme_Tarihi')
DBSetProp('TUMIZLEMELISTVIEW.izleme_tarihi', 'Field', 'DataType', "T")
DBSetProp('TUMIZLEMELISTVIEW.izleme_tarihi', 'Field', 'DefaultValue', "datetime()")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.izleme_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFECDESCRIPT","Izleme Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFECFRMCAPTN","Ýzleme Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFECDLGCAPTN","Ýzleme Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFECGRDCAPTN","Ýzleme Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFECRPTCAPTN","Ýzleme Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFEMTOOLTIP","Ýzleme Tarihi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ýzleme Tarihi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFECQFINDTAG","izlmtarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_tarihi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.izleme_sonucu field.
DBSetProp('TUMIZLEMELISTVIEW.izleme_sonucu', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.izleme_sonucu', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.izleme_sonucu', 'Field', 'UpdateName', 'dbo.Izleme.Izleme_Sonucu')
DBSetProp('TUMIZLEMELISTVIEW.izleme_sonucu', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.izleme_sonucu
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECDESCRIPT","Izleme Sonucu Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECFRMCAPTN","Ýzleme Sonucu") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECDLGCAPTN","Ýzleme Sonucu") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECGRDCAPTN","Ýzleme Sonucu") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECRPTCAPTN","Ýzleme Sonucu") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFEMTOOLTIP","Ýzleme Sonucu                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFEMSTATUSTXT","Ýzleme Sonucu                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECLUTABLE","hbysdata!izlemesonuculookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECLUTAG","izleme_sonucu") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFEMLUFIELDS","izleme_sonucu") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFEMLUUPDTEXP","Izlemesonuculookupview.izleme_sonucu") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.izleme_sonucu","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.odeme_sozu_tarihi field.
DBSetProp('TUMIZLEMELISTVIEW.odeme_sozu_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.odeme_sozu_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.odeme_sozu_tarihi', 'Field', 'UpdateName', 'dbo.Izleme.Odeme_Sozu_Tarihi')
DBSetProp('TUMIZLEMELISTVIEW.odeme_sozu_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.odeme_sozu_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECDESCRIPT","Odeme Sozu Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECFRMCAPTN","Ödeme Sözü Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECDLGCAPTN","Ödeme Sözü Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECGRDCAPTN","Ödeme Sözü Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECRPTCAPTN","Ödeme Sözü Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFEMTOOLTIP","Ödeme Sözü Tarihi                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFEMSTATUSTXT","Ödeme Sözü Tarihi                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_tarihi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.odeme_sozu_miktari field.
DBSetProp('TUMIZLEMELISTVIEW.odeme_sozu_miktari', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.odeme_sozu_miktari', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.odeme_sozu_miktari', 'Field', 'UpdateName', 'dbo.Izleme.Odeme_Sozu_Miktari')
DBSetProp('TUMIZLEMELISTVIEW.odeme_sozu_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.odeme_sozu_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFECDESCRIPT","Odeme Sozu Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFECFRMCAPTN","Ödeme Sözü Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFECDLGCAPTN","Ödeme Sözü Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFECGRDCAPTN","Ödeme Sözü Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFECRPTCAPTN","Ödeme Sözü Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMTOOLTIP","Ödeme Sözü Miktarý                                   ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMSTATUSTXT","Ödeme Sözü Miktarý                                   ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFENDISPORDER",8) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999.99") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.odeme_sozu_miktari","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.aciklama field.
DBSetProp('TUMIZLEMELISTVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Izleme.Aciklama')
DBSetProp('TUMIZLEMELISTVIEW.aciklama', 'Field', 'DataType', "M")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.personel_id field.
DBSetProp('TUMIZLEMELISTVIEW.personel_id', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.personel_id', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.personel_id', 'Field', 'UpdateName', 'dbo.Izleme.Personel_Id')
DBSetProp('TUMIZLEMELISTVIEW.personel_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.personel_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECDESCRIPT","Personel Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECLUTABLE","hbysdata!personellookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECLUTAG","personel_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFEMLUFIELDS","personel_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFEMLUUPDTEXP","Personellookupview.personel_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFENDISPORDER",6) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_id","FIELD",;
		"VFEMLUUPDFLDS","personel_adi") &&After Lookup Update Field List
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.personel_adi field.
DBSetProp('TUMIZLEMELISTVIEW.personel_adi', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.personel_adi', 'Field', 'Updatable', .T.)
DBSetProp('TUMIZLEMELISTVIEW.personel_adi', 'Field', 'UpdateName', 'dbo.Izleme.Personel_Adi')
DBSetProp('TUMIZLEMELISTVIEW.personel_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.personel_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFECDESCRIPT","Personel Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFECFRMCAPTN","Personel Adý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFECDLGCAPTN","Personel Adý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFECGRDCAPTN","Personel Adý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFECRPTCAPTN","Personel Adý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFEMTOOLTIP","Personel Adý                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFEMSTATUSTXT","Personel Adý                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.personel_adi","FIELD",;
		"VFENDISPORDER",7) &&Display Order
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.aciklama1 field.
DBSetProp('TUMIZLEMELISTVIEW.aciklama1', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.aciklama1', 'Field', 'Updatable', .F.)
DBSetProp('TUMIZLEMELISTVIEW.aciklama1', 'Field', 'UpdateName', 'dbo.Izleme.Aciklama')
DBSetProp('TUMIZLEMELISTVIEW.aciklama1', 'Field', 'DataType', "C(253)")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.aciklama1
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFECDESCRIPT","Aciklama1 Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.aciklama1","FIELD",;
		"VFENDISPORDER",10) &&Display Order
ENDIF
 
*** Props for the TUMIZLEMELISTVIEW.icra_dosya_no field.
DBSetProp('TUMIZLEMELISTVIEW.icra_dosya_no', 'Field', 'KeyField', .F.)
DBSetProp('TUMIZLEMELISTVIEW.icra_dosya_no', 'Field', 'Updatable', .F.)
DBSetProp('TUMIZLEMELISTVIEW.icra_dosya_no', 'Field', 'UpdateName', 'dbo.IcraDosya.Icra_Dosya_No')
DBSetProp('TUMIZLEMELISTVIEW.icra_dosya_no', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for TUMIZLEMELISTVIEW.icra_dosya_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFECDESCRIPT","Icra Dosya No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFECFRMCAPTN","Ýcra Dosya No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFECDLGCAPTN","Ýcra Dosya No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFECGRDCAPTN","Ýcra Dosya No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFECRPTCAPTN","Ýcra Dosya No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFEMTOOLTIP","Ýcra Dosya No                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFEMSTATUSTXT","Ýcra Dosya No                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!TUMIZLEMELISTVIEW.icra_dosya_no","FIELD",;
		"VFENDISPORDER",13) &&Display Order
ENDIF
 
