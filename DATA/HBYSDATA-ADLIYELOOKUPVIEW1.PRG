***************** Begin View Definition ADLIYELOOKUPVIEW1 ***************
CREATE SQL VIEW "ADLIYELOOKUPVIEW1" ;    AS SELECT Adlibolge.adliye_adi FROM hbysreferans!adlibolge
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!adlibolge')
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('ADLIYELOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
 
	*** DBCX View Properties for ADLIYELOOKUPVIEW1
	GoExplorer.odbcx.Validate("ADLIYELOOKUPVIEW1","View")
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1","VIEW",;
		"VFECDESCRIPT","Adliyelookupview1 Local View") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1","VIEW",;
		"VFECCLASS","iCursor") &&Default Cursor Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1","VIEW",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Default Cursor Class Library
ENDIF
*!* Field Level Properties for ADLIYELOOKUPVIEW1
*** Props for the ADLIYELOOKUPVIEW1.adliye_adi field.
DBSetProp('ADLIYELOOKUPVIEW1.adliye_adi', 'Field', 'KeyField', .F.)
DBSetProp('ADLIYELOOKUPVIEW1.adliye_adi', 'Field', 'Updatable', .T.)
DBSetProp('ADLIYELOOKUPVIEW1.adliye_adi', 'Field', 'UpdateName', 'hbysreferans!adlibolge.adliye_adi')
DBSetProp('ADLIYELOOKUPVIEW1.adliye_adi', 'Field', 'DataType', "C(50)")
*** DBCX Field Properties for ADLIYELOOKUPVIEW1.adliye_adi
IF lWriteDBCXProps
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFECDESCRIPT","Adliye Adi Field") &&Description
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFECFRMCAPTN","Adliye Adi") &&Form Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFECDLGCAPTN","Adliye Adi") &&Dialog Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFECGRDCAPTN","Adliye Adi") &&Grid Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFECRPTCAPTN","Adliye Adi") &&Report Caption
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFEMTOOLTIP","Adliye Adi") &&Tooltip Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFEMSTATUSTXT","Adliye Adi") &&Status Bar Text
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFELSEARCH",.T.) &&Searchable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFELFILTER",.T.) &&Filterable
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFECLOOKUPFRM","[DEFAULT]") &&Look Up Display Form
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFECCLASS","iField") &&Behavior Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFEMCLASSLIB","ILIBS\IDATA.VCX") &&Behavior Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFECOBJTYPE","itextbox") &&User Interface Class
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFEMOBJINFO","ILIBS\ICONTRLS.VCX") &&User Interface Class Library
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFELQUICKFIND",.T.) &&Allow Quick Find
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFENDFLTTYPE",1) &&Default Type
	GoExplorer.odbcx.DBCXSetProp("HBYSDATA!ADLIYELOOKUPVIEW1.adliye_adi","FIELD",;
		"VFENDISPORDER",1) &&Display Order
ENDIF
 