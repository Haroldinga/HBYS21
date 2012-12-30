***************** Begin View Definition AVANSVIEW ***************


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



CREATE SQL VIEW "AVANSVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Avans.Avans_Id,;
		Avans.Buro_Id,;
		Avans.Muvekkil_Id,;
		Avans.Avans_Tarihi,;
		Avans.Avans_Miktari,;
		Avans.Aciklama;
	FROM dbo.Avans Avans

DBSetProp('AVANSVIEW', 'View', 'UpdateType', 1)
DBSetProp('AVANSVIEW', 'View', 'WhereType', 1)
DBSetProp('AVANSVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('AVANSVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('AVANSVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('AVANSVIEW', 'View', 'MaxRecords', -1)
DBSetProp('AVANSVIEW', 'View', 'Tables', 'dbo.Avans')
DBSetProp('AVANSVIEW', 'View', 'Prepared', .F.)
DBSetProp('AVANSVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('AVANSVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('AVANSVIEW', 'View', 'FetchSize', -1)
DBSetProp('AVANSVIEW', 'View', 'ParameterList', "vp_Avans_Id,'C';vp_Muvekkil_Id,'C';vp_Buro_Id,'C'")
DBSetProp('AVANSVIEW', 'View', 'Comment', "")
DBSetProp('AVANSVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('AVANSVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for AVANSVIEW
	GoExplorer.odbcx.Validate("AVANSVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW","VIEW",;
		"VFECDESCRIPT","Avansview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Avans_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Avans Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFECFRMCAPTN","Avans ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFECDLGCAPTN","Avans ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFEMTOOLTIP","Avans ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFEMSTATUSTXT","Avans ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFEMCOMPARETO","Avans_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Avans_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Muvekkil_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Muvekkil Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECFRMCAPTN","Müvekkil") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECDLGCAPTN","Müvekkil") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMTOOLTIP","Müvekkil                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMSTATUSTXT","Müvekkil                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLUTAG","muvekkil_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECADDFORM","MUVEKKILLOOKUPVIEWEDITFORM") &&Look Up Add Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMCOMPARETO","Muvekkil_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Muvekkil_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Buro_Id
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECDESCRIPT","Vp Buro Id View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECFRMCAPTN","Büro") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECDLGCAPTN","Büro") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFENVPSIZE",36) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFEMTOOLTIP","Büro                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFEMSTATUSTXT","Büro                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECLUTABLE","hbysdata!burolookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECLUTAG","buro_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFEMLUFIELDS","buro_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFEMLUUPDTEXP","Burolookupview.buro_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECADDFORM","BUROVIEWEDITFORM") &&Look Up Add Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFEMCOMPARETO","Buro_Id") &&Compare to Field/Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.vp_Buro_Id","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!avansview.avnstarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!avansview","avnstarh","AVANS_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!avansview.avnstarh","INDEX",;
		"VFECDESCRIPT","Avnstarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!avansview.avnstarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!avansview.avnstarh","INDEX",;
		"VFECTAGCAPTN","Avnstarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!avansview.avnstarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for AVANSVIEW
*** Props for the AVANSVIEW.avans_id field.
DBSetProp('AVANSVIEW.avans_id', 'Field', 'KeyField', .T.)
DBSetProp('AVANSVIEW.avans_id', 'Field', 'Updatable', .T.)
DBSetProp('AVANSVIEW.avans_id', 'Field', 'UpdateName', 'dbo.Avans.Avans_Id')
DBSetProp('AVANSVIEW.avans_id', 'Field', 'DataType', "C(36)")
DBSetProp('AVANSVIEW.avans_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for AVANSVIEW.avans_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFECDESCRIPT","Avans Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFECFRMCAPTN","Avans ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFECDLGCAPTN","Avans ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFECGRDCAPTN","Avans ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFECRPTCAPTN","Avans ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFEMTOOLTIP","Avans ID                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFEMSTATUSTXT","Avans ID                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the AVANSVIEW.buro_id field.
DBSetProp('AVANSVIEW.buro_id', 'Field', 'KeyField', .F.)
DBSetProp('AVANSVIEW.buro_id', 'Field', 'Updatable', .T.)
DBSetProp('AVANSVIEW.buro_id', 'Field', 'UpdateName', 'dbo.Avans.Buro_Id')
DBSetProp('AVANSVIEW.buro_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for AVANSVIEW.buro_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECDESCRIPT","Buro Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECFRMCAPTN","Büro") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECDLGCAPTN","Büro") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECGRDCAPTN","Büro") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECRPTCAPTN","Büro") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFEMTOOLTIP","Büro                                                 ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFEMSTATUSTXT","Büro                                                 ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECLUTABLE","hbysdata!burolookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECLUTAG","buro_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFEMLUFIELDS","buro_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFEMLUUPDTEXP","Burolookupview.buro_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.buro_id","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the AVANSVIEW.muvekkil_id field.
DBSetProp('AVANSVIEW.muvekkil_id', 'Field', 'KeyField', .F.)
DBSetProp('AVANSVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('AVANSVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.Avans.Muvekkil_Id')
DBSetProp('AVANSVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
*** DBCX Field Properties for AVANSVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Müvekkil") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Müvekkil") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Müvekkil") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Müvekkil") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Müvekkil                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Müvekkil                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECLUTABLE","hbysdata!muvekkillookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECLUTAG","muvekkil_id") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFEMLUFIELDS","muvekkil_adi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFEMLUUPDTEXP","Muvekkillookupview.muvekkil_id") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECADDFORM","MUVEKKILLOOKUPVIEWEDITFORM") &&Look Up Add Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","icombobox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the AVANSVIEW.avans_tarihi field.
DBSetProp('AVANSVIEW.avans_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('AVANSVIEW.avans_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('AVANSVIEW.avans_tarihi', 'Field', 'UpdateName', 'dbo.Avans.Avans_Tarihi')
DBSetProp('AVANSVIEW.avans_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for AVANSVIEW.avans_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFECDESCRIPT","Avans Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFECFRMCAPTN","Avans Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFECDLGCAPTN","Avans Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFECGRDCAPTN","Avans Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFECRPTCAPTN","Avans Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFEMTOOLTIP","Avans Tarihi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFEMSTATUSTXT","Avans Tarihi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFECOBJTYPE","idatecontainer") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\IDATETIMECONTROLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFECQFINDTAG","avnstarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_tarihi","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the AVANSVIEW.avans_miktari field.
DBSetProp('AVANSVIEW.avans_miktari', 'Field', 'KeyField', .F.)
DBSetProp('AVANSVIEW.avans_miktari', 'Field', 'Updatable', .T.)
DBSetProp('AVANSVIEW.avans_miktari', 'Field', 'UpdateName', 'dbo.Avans.Avans_Miktari')
DBSetProp('AVANSVIEW.avans_miktari', 'Field', 'InputMask', "999,999,999,999")
DBSetProp('AVANSVIEW.avans_miktari', 'Field', 'DataType', "Y")
*** DBCX Field Properties for AVANSVIEW.avans_miktari
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFECDESCRIPT","Avans Miktari Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFECFRMCAPTN","Avans Miktarý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFECDLGCAPTN","Avans Miktarý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFECGRDCAPTN","Avans Miktarý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFECRPTCAPTN","Avans Miktarý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFEMTOOLTIP","Avans Miktarý                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFEMSTATUSTXT","Avans Miktarý                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFEMINPUTMASK","999,999,999,999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.avans_miktari","FIELD",;
		"VFEMFORMAT","RKZ") &&Format
ENDIF
 
*** Props for the AVANSVIEW.aciklama field.
DBSetProp('AVANSVIEW.aciklama', 'Field', 'KeyField', .F.)
DBSetProp('AVANSVIEW.aciklama', 'Field', 'Updatable', .T.)
DBSetProp('AVANSVIEW.aciklama', 'Field', 'UpdateName', 'dbo.Avans.Aciklama')
DBSetProp('AVANSVIEW.aciklama', 'Field', 'DataType', "M")
*** DBCX Field Properties for AVANSVIEW.aciklama
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFECDESCRIPT","Aciklama Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFECFRMCAPTN","Açýklama") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFECDLGCAPTN","Açýklama") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFECGRDCAPTN","Açýklama") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFECRPTCAPTN","Açýklama") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFEMTOOLTIP","Açýklama                                             ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFEMSTATUSTXT","Açýklama                                             ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFECOBJTYPE","ieditbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!AVANSVIEW.aciklama","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
