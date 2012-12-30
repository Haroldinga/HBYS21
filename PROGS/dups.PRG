#INCLUDE FOXPRO.H 

LOCAL ; 
loProject AS PROJECT, ; 
loFile AS FILE, ; 
loException AS Exception, ; 
lnSelect AS Number, ; 
lnRecno AS Number, ; 
lcAlias AS Character 

TRY
  loProject = _VFP.ActiveProject
CATCH
  MODIFY PROJECT (GETFILE("PJX")) NOWAIT  
  IF TYPE("_VFP.ActiveProject.Name") = T_CHARACTER
     loProject = _VFP.ActiveProject
  ENDIF
ENDTRY

ACTIVATE SCREEN
CLEAR

IF VARTYPE(loProject) = T_OBJECT
   SELECT 0 
   lcAlias = SYS(2015)
   USE (loProject.Name) AGAIN SHARED ALIAS (lcAlias)
   ? "Potential Duplicate Files:" 
   SELECT ;
           PADR(NAME,254) AS cName, ; 
           CNT(*) AS nOccurs ;
   FROM ;    
           (lcAlias) ;   
           GROUP BY 1 ; 
           HAVING nOccurs > 1 ;
           TO SCREEN
   USE IN (lcAlias)               
   IF _TALLY = 0
      ? "None Detected"
      ? 
   ENDIF
   
   FOR EACH loFile IN loProject.Files
           TRY    
                   DO CASE 
                      CASE INLIST(loFile.Type, FILETYPE_PROGRAM, FILETYPE_QUERY) 
                           COMPILE (loFile.Name)
                      CASE loFile.Type = FILETYPE_CLASSLIB 
                           COMPILE CLASSLIB (loFile.Name)      
                      CASE loFile.Type = FILETYPE_FORM
                           COMPILE FORM (loFile.Name)     
                      CASE loFile.Type = FILETYPE_DATABASE
                           COMPILE DATABASE (loFile.Name)     
                      CASE loFile.Type = FILETYPE_MENU                           
                           lnSelect = SELECT() 
                           SELECT 0
                           USE (loProject.Name) AGAIN SHARED ALIAS _PJX
                           LOCATE FOR UPPER(ADDBS(_PJX.HOMEDIR) + _PJX.NAME) = UPPER(loFile.Name)
                           IF FOUND()
                              lnRecno = RECNO() 
                              USE
                              DO (_GENMENU) WITH loProject.Name, lnRecno 
                           ELSE
                              USE 
                           ENDIF 
                           SELECT (lnSelect) 
                   ENDCASE 
                   
           CATCH TO loException
                    ? loFile.Name, loException.Message
                    ENDTRY
                                  
    NEXT 
ENDIF

   
     