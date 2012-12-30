***************** Begin View Definition FAIZTIPILISTVIEW ***************


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



CREATE SQL VIEW "FAIZTIPILISTVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Faiztipi.FaizTipi_Id,;
		Faiztipi.Faiz_Tipi,;
		Faiztipi.Baslama_Tarihi,;
		Faiztipi.Faiz_Orani,;
		Faiztipi.Uygulama_Tipi,;
		Faiztipi.Yillik_Gun_Sayisi;
	FROM dbo.FaizTipi Faiztipi

DBSetProp('FAIZTIPILISTVIEW', 'View', 'UpdateType', 1)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'WhereType', 3)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'MaxRecords', -1)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'Tables', 'dbo.FaizTipi')
DBSetProp('FAIZTIPILISTVIEW', 'View', 'Prepared', .F.)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'FetchSize', -1)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'ParameterList', "vp_Faiz_Tipi,'C';vp_Baslama_Tarihi,'C'")
DBSetProp('FAIZTIPILISTVIEW', 'View', 'Comment', "")
DBSetProp('FAIZTIPILISTVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('FAIZTIPILISTVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for FAIZTIPILISTVIEW
	GoExplorer.odbcx.Validate("FAIZTIPILISTVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW","VIEW",;
		"VFECDESCRIPT","Faiztipilistview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
 
	*** DBCX View Parameter Properties for vp_Faiz_Tipi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECDESCRIPT","Vp Faiz Tipi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECFRMCAPTN","Faiz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECDLGCAPTN","Faiz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFENVPSIZE",25) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFEMTOOLTIP","Faiz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFEMSTATUSTXT","Faiz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFENLUTYPE",2) &&Look Up Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECLUTABLE","hbysdata!faiztipilookupview") &&Look Up Cursor
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECLUTAG","faiz_tipi") &&Look Up Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFEMLUFIELDS","faiz_tipi") &&Look Up Display Fields
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFEMLUUPDTEXP","Faiztipilookupview.faiz_tipi") &&Look Up Update Expression
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Faiz_Tipi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX View Parameter Properties for vp_Baslama_Tarihi
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECDESCRIPT","Vp Baslama Tarihi View Parameter") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECFRMCAPTN","Baþlama Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECDLGCAPTN","Baþlama Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECVPTYPE","C") &&Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFENVPSIZE",8) &&Size
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMTOOLTIP","Baþlama Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMSTATUSTXT","Baþlama Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECCLASS","iDynamicViewParameter") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFECOPERATOR","Begins With") &&SQL Comparison Operator
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFELSKIPEMPTY",.T.) &&Omit From SQL when empty
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFELSKIPNULL",.T.) &&Omit From SQL when Null
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFELPICKOPER",.T.) &&Allow Operator Selection
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.vp_Baslama_Tarihi","PARAMETER",;
		"VFEMOPERLIST","Equals, Contains, Begins With, Ends With") &&Available Operators
 
	*** DBCX Index Properties for hbysdata!faiztipilistview.basltarh
	GoExplorer.odbcx.AddViewIndex("hbysdata!faiztipilistview","basltarh","BASLAMA_TARIHI","")
	GoExplorer.odbcx.DBCXSetProp("hbysdata!faiztipilistview.basltarh","INDEX",;
		"VFECDESCRIPT","Basltarh Index") &&Description
	GoExplorer.odbcx.DBCXSetProp("hbysdata!faiztipilistview.basltarh","INDEX",;
		"VFELDISPLAY",.T.) &&Display
	GoExplorer.odbcx.DBCXSetProp("hbysdata!faiztipilistview.basltarh","INDEX",;
		"VFECTAGCAPTN","Basltarh") &&Tag Caption
	GoExplorer.odbcx.DBCXSetProp("hbysdata!faiztipilistview.basltarh","INDEX",;
		"VFENDISPORDER",1) &&Display Order
ENDIF

*!* Field Level Properties for FAIZTIPILISTVIEW
*** Props for the FAIZTIPILISTVIEW.faiztipi_id field.
DBSetProp('FAIZTIPILISTVIEW.faiztipi_id', 'Field', 'KeyField', .T.)
DBSetProp('FAIZTIPILISTVIEW.faiztipi_id', 'Field', 'Updatable', .T.)
DBSetProp('FAIZTIPILISTVIEW.faiztipi_id', 'Field', 'UpdateName', 'dbo.FaizTipi.FaizTipi_Id')
DBSetProp('FAIZTIPILISTVIEW.faiztipi_id', 'Field', 'DataType', "C(36)")
DBSetProp('FAIZTIPILISTVIEW.faiztipi_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for FAIZTIPILISTVIEW.faiztipi_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFECDESCRIPT","Faiztipi Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFECFRMCAPTN","Faiz Tipi ID") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFECDLGCAPTN","Faiz Tipi ID") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFECGRDCAPTN","Faiz Tipi ID") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFECRPTCAPTN","Faiz Tipi ID") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFEMTOOLTIP","Faiz Tipi ID                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFEMSTATUSTXT","Faiz Tipi ID                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiztipi_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the FAIZTIPILISTVIEW.faiz_tipi field.
DBSetProp('FAIZTIPILISTVIEW.faiz_tipi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZTIPILISTVIEW.faiz_tipi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZTIPILISTVIEW.faiz_tipi', 'Field', 'UpdateName', 'dbo.FaizTipi.Faiz_Tipi')
DBSetProp('FAIZTIPILISTVIEW.faiz_tipi', 'Field', 'DataType', "C(25)")
*** DBCX Field Properties for FAIZTIPILISTVIEW.faiz_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFECDESCRIPT","Faiz Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFECFRMCAPTN","Faiz Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFECDLGCAPTN","Faiz Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFECGRDCAPTN","Faiz Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFECRPTCAPTN","Faiz Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFEMTOOLTIP","Faiz Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFEMSTATUSTXT","Faiz Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the FAIZTIPILISTVIEW.baslama_tarihi field.
DBSetProp('FAIZTIPILISTVIEW.baslama_tarihi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZTIPILISTVIEW.baslama_tarihi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZTIPILISTVIEW.baslama_tarihi', 'Field', 'UpdateName', 'dbo.FaizTipi.Baslama_Tarihi')
DBSetProp('FAIZTIPILISTVIEW.baslama_tarihi', 'Field', 'DataType', "D")
*** DBCX Field Properties for FAIZTIPILISTVIEW.baslama_tarihi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFECDESCRIPT","Baslama Tarihi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFECFRMCAPTN","Baþlama Tarihi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFECDLGCAPTN","Baþlama Tarihi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFECGRDCAPTN","Baþlama Tarihi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFECRPTCAPTN","Baþlama Tarihi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMTOOLTIP","Baþlama Tarihi                                       ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMSTATUSTXT","Baþlama Tarihi                                       ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFEMOBJINFO","ILIBS\icontrls.vcx") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFECQFINDTAG","basltarh") &&Search Index Tag
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.baslama_tarihi","FIELD",;
		"VFELSORTABLE",.T.) &&Sortable
ENDIF
 
*** Props for the FAIZTIPILISTVIEW.faiz_orani field.
DBSetProp('FAIZTIPILISTVIEW.faiz_orani', 'Field', 'KeyField', .F.)
DBSetProp('FAIZTIPILISTVIEW.faiz_orani', 'Field', 'Updatable', .T.)
DBSetProp('FAIZTIPILISTVIEW.faiz_orani', 'Field', 'UpdateName', 'dbo.FaizTipi.Faiz_Orani')
DBSetProp('FAIZTIPILISTVIEW.faiz_orani', 'Field', 'DataType', "Y")
*** DBCX Field Properties for FAIZTIPILISTVIEW.faiz_orani
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFECDESCRIPT","Faiz Orani Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFECFRMCAPTN","Faiz Oraný %") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFECDLGCAPTN","Faiz Oraný %") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFECGRDCAPTN","Faiz Oraný %") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFECRPTCAPTN","Faiz Oraný %") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFEMTOOLTIP","Faiz Oraný %                                         ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFEMSTATUSTXT","Faiz Oraný %                                         ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFENDISPORDER",4) &&Display Order
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFEMINPUTMASK","999.999") &&Input Mask
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.faiz_orani","FIELD",;
		"VFEMFORMAT","K") &&Format
ENDIF
 
*** Props for the FAIZTIPILISTVIEW.uygulama_tipi field.
DBSetProp('FAIZTIPILISTVIEW.uygulama_tipi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZTIPILISTVIEW.uygulama_tipi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZTIPILISTVIEW.uygulama_tipi', 'Field', 'UpdateName', 'dbo.FaizTipi.Uygulama_Tipi')
DBSetProp('FAIZTIPILISTVIEW.uygulama_tipi', 'Field', 'DataType', "C(6)")
*** DBCX Field Properties for FAIZTIPILISTVIEW.uygulama_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECDESCRIPT","Uygulama Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECFRMCAPTN","Uygulama Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECDLGCAPTN","Uygulama Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECGRDCAPTN","Uygulama Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECRPTCAPTN","Uygulama Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMTOOLTIP","Uygulama Tipi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMSTATUSTXT","Uygulama Tipi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFEMINLIST",'"Aylýk","Yýllýk"') &&Value Is In List
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.uygulama_tipi","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
*** Props for the FAIZTIPILISTVIEW.yillik_gun_sayisi field.
DBSetProp('FAIZTIPILISTVIEW.yillik_gun_sayisi', 'Field', 'KeyField', .F.)
DBSetProp('FAIZTIPILISTVIEW.yillik_gun_sayisi', 'Field', 'Updatable', .T.)
DBSetProp('FAIZTIPILISTVIEW.yillik_gun_sayisi', 'Field', 'UpdateName', 'dbo.FaizTipi.Yillik_Gun_Sayisi')
DBSetProp('FAIZTIPILISTVIEW.yillik_gun_sayisi', 'Field', 'DataType', "I")
DBSetProp('FAIZTIPILISTVIEW.yillik_gun_sayisi', 'Field', 'DefaultValue', "365")
*** DBCX Field Properties for FAIZTIPILISTVIEW.yillik_gun_sayisi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECDESCRIPT","Yillik Gun Sayisi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECFRMCAPTN","Yýllýk Gün Sayýsý") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECDLGCAPTN","Yýllýk Gün Sayýsý") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECGRDCAPTN","Yýllýk Gün Sayýsý") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECRPTCAPTN","Yýllýk Gün Sayýsý") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFEMTOOLTIP","Yýllýk Gün Sayýsý                                    ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFEMSTATUSTXT","Yýllýk Gün Sayýsý                                    ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFENDFLTTYPE",2) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!FAIZTIPILISTVIEW.yillik_gun_sayisi","FIELD",;
		"VFENDISPORDER",6) &&Display Order
ENDIF
 
