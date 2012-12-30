***************** Begin View Definition MUVEKKILLOOKUPVIEW ***************


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



CREATE SQL VIEW "MUVEKKILLOOKUPVIEW" ; 
 REMOTE CONNECT "HBYSDataConnect" ; 
	AS SELECT Muvekkil.Muvekkil_Id,;
		Muvekkil.Muvekkil_Tipi,;
		Muvekkil.Muvekkil_Adi,;
		Muvekkil.Ticaret_Sicil_No,;
		Muvekkil.TcKimlik_No;
	FROM dbo.Muvekkil Muvekkil

DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'UpdateType', 1)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'WhereType', 3)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'FetchMemo', .T.)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'SendUpdates', .T.)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'UseMemoSize', 255)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'MaxRecords', -1)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'Tables', 'dbo.Muvekkil')
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'Prepared', .F.)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'CompareMemo', .T.)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'FetchAsNeeded', .F.)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'FetchSize', -1)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'Comment', "")
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'BatchUpdateCount', 1)
DBSetProp('MUVEKKILLOOKUPVIEW', 'View', 'ShareConnection', .T.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for MUVEKKILLOOKUPVIEW
	GoExplorer.odbcx.Validate("MUVEKKILLOOKUPVIEW","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW","VIEW",;
		"VFECDESCRIPT","Muvekkillookupview Remote View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF

*!* Field Level Properties for MUVEKKILLOOKUPVIEW
*** Props for the MUVEKKILLOOKUPVIEW.muvekkil_id field.
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_id', 'Field', 'KeyField', .T.)
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_id', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_id', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Id')
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_id', 'Field', 'DataType', "C(36)")
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_id', 'Field', 'DefaultValue', "GUID(36)")
*** DBCX Field Properties for MUVEKKILLOOKUPVIEW.muvekkil_id
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECDESCRIPT","Muvekkil Id Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECFRMCAPTN","Muvekkil Id") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECDLGCAPTN","Muvekkil Id") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECGRDCAPTN","Muvekkil Id") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECRPTCAPTN","Muvekkil Id") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFEMTOOLTIP","Muvekkil Id") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Id") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFENDFLTTYPE",4) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_id","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLOOKUPVIEW.muvekkil_tipi field.
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_tipi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_tipi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_tipi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Tipi')
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_tipi', 'Field', 'DataType', "C(6)")
*** DBCX Field Properties for MUVEKKILLOOKUPVIEW.muvekkil_tipi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECDESCRIPT","Muvekkil Tipi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECFRMCAPTN","Müvekkil Tipi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECDLGCAPTN","Müvekkil Tipi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECGRDCAPTN","Müvekkil Tipi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECRPTCAPTN","Müvekkil Tipi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFEMTOOLTIP","Müvekkil Tipi                                        ") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFEMSTATUSTXT","Müvekkil Tipi                                        ") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_tipi","FIELD",;
		"VFENDISPORDER",2) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLOOKUPVIEW.muvekkil_adi field.
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_adi', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_adi', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_adi', 'Field', 'UpdateName', 'dbo.Muvekkil.Muvekkil_Adi')
DBSetProp('MUVEKKILLOOKUPVIEW.muvekkil_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for MUVEKKILLOOKUPVIEW.muvekkil_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECDESCRIPT","Muvekkil Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECFRMCAPTN","Muvekkil Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECDLGCAPTN","Muvekkil Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECGRDCAPTN","Muvekkil Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECRPTCAPTN","Muvekkil Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFEMTOOLTIP","Muvekkil Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFEMSTATUSTXT","Muvekkil Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.muvekkil_adi","FIELD",;
		"VFENDISPORDER",3) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLOOKUPVIEW.ticaret_sicil_no field.
DBSetProp('MUVEKKILLOOKUPVIEW.ticaret_sicil_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLOOKUPVIEW.ticaret_sicil_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLOOKUPVIEW.ticaret_sicil_no', 'Field', 'UpdateName', 'dbo.Muvekkil.Ticaret_Sicil_No')
DBSetProp('MUVEKKILLOOKUPVIEW.ticaret_sicil_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILLOOKUPVIEW.ticaret_sicil_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFECDESCRIPT","Ticaret Sicil No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFECFRMCAPTN","Ticaret Sicil No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFECDLGCAPTN","Ticaret Sicil No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFECGRDCAPTN","Ticaret Sicil No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFECRPTCAPTN","Ticaret Sicil No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFEMTOOLTIP","Ticaret Sicil No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFEMSTATUSTXT","Ticaret Sicil No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.ticaret_sicil_no","FIELD",;
		"VFENDISPORDER",4) &&Display Order
ENDIF
 
*** Props for the MUVEKKILLOOKUPVIEW.tckimlik_no field.
DBSetProp('MUVEKKILLOOKUPVIEW.tckimlik_no', 'Field', 'KeyField', .F.)
DBSetProp('MUVEKKILLOOKUPVIEW.tckimlik_no', 'Field', 'Updatable', .T.)
DBSetProp('MUVEKKILLOOKUPVIEW.tckimlik_no', 'Field', 'UpdateName', 'dbo.Muvekkil.TcKimlik_No')
DBSetProp('MUVEKKILLOOKUPVIEW.tckimlik_no', 'Field', 'DataType', "C(15)")
*** DBCX Field Properties for MUVEKKILLOOKUPVIEW.tckimlik_no
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFECDESCRIPT","Tckimlik No Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFECFRMCAPTN","Tckimlik No") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFECDLGCAPTN","Tckimlik No") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFECGRDCAPTN","Tckimlik No") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFECRPTCAPTN","Tckimlik No") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFEMTOOLTIP","Tckimlik No") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFEMSTATUSTXT","Tckimlik No") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!MUVEKKILLOOKUPVIEW.tckimlik_no","FIELD",;
		"VFENDISPORDER",5) &&Display Order
ENDIF
 
