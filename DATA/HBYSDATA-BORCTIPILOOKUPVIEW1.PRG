***************** Begin View Definition BORCTIPILOOKUPVIEW1 ***************


LOCAL LAOPENEDDBCS[1,1], lcSet_Exact
PRIVATE lWriteDBCXProps

lWriteDBCXProps=.T.

lcSet_Exact=SET('EXACT')
IF lcSet_Exact='OFF'
	SET EXACT ON
ENDIF


IF ADATABASES(LAOPENEDDBCS)=0 or ASCAN(LAOPENEDDBCS,"HBYSREFERANS")=0
	OPEN DATABASE "C:\VFPPROJECTS\HBYS20\DATA\hbysreferans"
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



CREATE SQL VIEW "BORCTIPILOOKUPVIEW1" ; 
	AS SELECT Borctipi.borc_tipi;
	FROM hbysreferans!borctipi

DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'UpdateType', 1)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'WhereType', 3)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'FetchMemo', .T.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'SendUpdates', .F.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'UseMemoSize', 255)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'MaxRecords', -1)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'Tables', 'hbysreferans!borctipi')
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'Prepared', .F.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'CompareMemo', .T.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'FetchAsNeeded', .F.)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'FetchSize', 100)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'Comment', "")
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'BatchUpdateCount', 1)
DBSetProp('BORCTIPILOOKUPVIEW1', 'View', 'ShareConnection', .F.)
IF lWriteDBCXProps
	*** No Non-Default DBCX Properties for View BORCTIPILOOKUPVIEW1
ENDIF

*!* Field Level Properties for BORCTIPILOOKUPVIEW1
*** Props for the BORCTIPILOOKUPVIEW1.borc_tipi field.
DBSetProp('BORCTIPILOOKUPVIEW1.borc_tipi', 'Field', 'KeyField', .F.)
DBSetProp('BORCTIPILOOKUPVIEW1.borc_tipi', 'Field', 'Updatable', .T.)
DBSetProp('BORCTIPILOOKUPVIEW1.borc_tipi', 'Field', 'UpdateName', 'hbysreferans!borctipi.borc_tipi')
DBSetProp('BORCTIPILOOKUPVIEW1.borc_tipi', 'Field', 'DataType', "C(25)")
*** No Non-Default DBCX Properties for Field BORCTIPILOOKUPVIEW1.borc_tipi
 
