#DEFINE DEBUGINFO .F.

SET PROCEDURE TO wwLocaleInfo ADDITIVE

*************************************************************
DEFINE CLASS wwLocaleInfo AS Relation
*************************************************************
*: Author: Rick Strahl
*:         (c) West Wind Technologies, 2004
*:Contact: http://www.west-wind.com
*:Created: 28.03.2004
*************************************************************
#IF .F.
*:Help Documentation
*:Topic:
Class LocaleInfo

*:Description:

*:Example:

*:Remarks:

*:SeeAlso:


*:ENDHELP
#ENDIF

*** Custom Properties
cLocaleId = "en-us"
nLocaleId = 0x0409
cLocaleName = "English (United States)"
cCountry = "United States"
cEnglishCountry = "United States"
cDateSeparator = "/"
cTimeSeparator = ":"
l24HourTime = .f.
cDateFormat = "MDY"
cDecimalPoint = "."
cThousandsSeparator = ","
cCurrencySymbol = "$"
cCurrencyLocation = "LEFT"


FUNCTION Init
DECLARE INTEGER GetLocaleInfo IN WIN32API ;
   INTEGER, INTEGER,STRING@,INTEGER @
ENDFUNC


************************************************************************
* LocaleInfo :: LocaleLookup
****************************************
***  Function: Returns the numeric LocaleId from a string Locale Id (en-US)
***    Assume:
***      Pass:
***    Return: 0 on failure - LocaleId otherwise
************************************************************************
FUNCTION LocaleLookup(lcLocaleId)
this.LocaleLookupTable()
LOCATE FOR Locale = LOWER(lcLocaleId)
IF !FOUND()
   RETURN 0
ENDIF

RETURN __Locales.LocaleId
ENDFUNC

************************************************************************
* LocaleInfo :: GetLocaleInfo
****************************************
***  Function: Loads local properties with Locale specific info
***    Assume:
***      Pass: Locale ID as a string (en-us) or numeric Id (1033 or 0x0409)
***            You can pass 0 to get the system default locale
***    Return: .t. or .F.
************************************************************************
FUNCTION GetLocaleInfo(lnLocale) 

IF VARTYPE(lnLocale) = "C"
   lnLocale = this.LocaleLookup(lnLocale)
ENDIF

*!*   IF lnLocale = 0
*!*      RETURN .f.
*!*   ENDIF

loLocale = this

STORE SPACE(3) TO lang,sublang
IF (GetLocaleInfo(lnLocale,89,@lang,3) < 3)
   RETURN .F.
ENDIF

*** Retrieving default Locale
IF lnLocale = 0
   lcLocaleId = SPACE(4)
   GetLocaleInfo(lnLocale,1,@lcLocaleid,4)
   loLocale.nLocaleId = EVAL("0x" + lcLocaleId)
   lnLocale = loLocale.nLocaleId
ENDIF

GetLocaleInfo(lnLocale,90,@sublang,3)
loLocale.cLocaleId = SUBSTR(lang,1,2) + "-" + LOWER(SUBSTR(sublang,1,2))
loLocale.nLocaleId = lnLocale


#IF DEBUGINFO
lcOutput = ""
FOR x = 1 TO 128
   buffer=SPACE(256)
   SIZE = 256
   GetLocaleInfo(lnLocale,x,@buffer,@size)
   lcOutput = lcOUtput + TRANSFORM(x) + " - " + buffer + CHR(13) + CHR(10)
ENDFOR
ShowText(lcOutput)
#Endif

buffer = SPACE(255)
lnsize = GetLocaleInfo(lnLocale,8,@buffer,255)
loLocale.cCountry = LEFT(buffer,lnSize-1)

buffer = SPACE(255)
lnsize = GetLocaleInfo(lnLocale,6,@buffer,255)
loLocale.cEnglishCountry = LEFT(buffer,lnSize-1)

buffer = "  " 
GetLocaleInfo(lnLocale,29,@buffer,2)
loLocale.cDateSeparator = LEFT(buffer,1)

buffer = "  " 
GetLocaleInfo(lnLocale,30,@buffer,2)
loLocale.cTimeSeparator = LEFT(buffer,1)

*** Date Format
buffer = SPACE(128)
lnsize = GetLocaleInfo(lnLocale,31,@buffer,128)
buffer = LEFT(buffer,lnSize-1)
ALINES(laItems,buffer,loLocale.cDateSeparator)
loLocale.cDateFormat = UPPER(LEFT(laItems[1],1) + LEFT(laItems[2],1) + LEFT(laItems[3],1))

buffer = SPACE(2)
lnsize = GetLocaleInfo(lnLocale,0x00000023,@buffer,2)
buffer = LEFT(buffer,lnSize-1)
IF buffer = "0"
   loLocale.l24hourTime = .f.
ELSE
   loLocale.l24hourTime = .t.
ENDIF


buffer = "  " 
GetLocaleInfo(lnLocale,22,@buffer,2)
loLocale.cDecimalPoint = LEFT(buffer,1)

buffer = "  " 
GetLocaleInfo(lnLocale,23,@buffer,2)
loLocale.cThousandsSeparator = LEFT(buffer,1)

buffer = SPACE(10)
lnSize = GetLocaleInfo(lnLocale,20,@buffer,10)
loLocale.cCurrencySymbol = LEFT(buffer,lnSize-1)

buffer = SPACE(2)
lnSize = GetLocaleInfo(lnLocale,27,@buffer,2)
lcT = LEFT(buffer,1)
IF lcT = "0" OR lcT = "2"
   loLocale.cCurrencyLocation = "LEFT"
ELSE
   loLocale.cCurrencyLocation = "RIGHT"
ENDIF

RETURN .T.
ENDFUNC

************************************************************************
* LocaleInfo :: SetLocaleInfo
****************************************
***  Function: Sets the FoxPro Locale settings based on a Locale
***    Assume:
***      Pass:
***    Return: .t. or .f.
************************************************************************
FUNCTION SetLocaleInfo(lnLocale,lcCurrencySymbol) 

LOCAL loLocale as Locale

IF !this.GetLocaleInfo(lnLocale)
   RETURN .F.
ENDIF

loLocale = this

SET DATE TO (loLocale.cDateFormat)
IF loLocale.l24HourTime
   SET HOURS TO 24
ELSE
   SET HOURS TO 12
ENDIF

SET MARK TO (loLOcale.cDateSeparator)
SET POINT TO (loLocale.cDecimalPoint)

IF !EMPTY(lcCurrencySymbol)
   SET CURRENCY TO (lcCurrencySymbol)
ELSE   
   SET CURRENCY TO (loLocale.cCurrencySymbol)
ENDIF   

RETURN .T.
ENDFUNC

************************************************************************
* LocaleInfo :: GetLocales
****************************************
***  Function: Returns a full list of Locales
***    Assume:
***      Pass:
***    Return: Collection of Locale objects with only the cLocaleid and
***            nLocaleId properties set.
************************************************************************
FUNCTION GetLocalesFromSystem()

CREATE CURSOR __Locales ( Locale C(5),Localeid I,FullName c(128))

FOR x = 1 TO 128000
   lang = SPACE(3)
   sublang = SPACE(3)

   IF (GetLocaleInfo(x,89,@lang,3) < 3)
      LOOP
   ENDIF
   
   GetLocaleInfo(x,90,@sublang,3)

   lcLocale = SUBSTR(lang,1,2) + "-" + LOWER(SUBSTR(sublang,1,2))
   LOCATE FOR Locale = lcLocale
   IF FOUND()
      LOOP
   ENDIF

   Buffer = SPACE(5)   
   GetLocaleInfo(x,1,@buffer,5)

   Language = SPACE(255)   
   lnsize = GetLocaleInfo(x,2,@Language,255)
   Language = LEFT(Language,lnSize-1)
      
   INSERT INTO __Locales VALUES ( lcLocale,EVALUATE( "0x" +LEFT(buffer,4) ),Language)
ENDFOR

INDEX ON FullName TAG Language 

RETURN RECCOUNT("__Locales")
ENDFUNC

************************************************************************
* LocaleInfo :: LocaleLookupTable
****************************************
***  Function: Returns a cursor __Locales that contains a fixed set
***            of Locales.
***    Assume: This list is pre-gen'd and must be refreshed for new
***            languages/locales from time to time.
***      Pass:
***    Return: nothing   cursor __Locales with two fields (Locale, LocaleID)
************************************************************************
FUNCTION LocaleLookupTable()

IF USED("__locales")
   SELECT __locales
   RETURN
ENDIF

CREATE CURSOR __Locales ( Locale C(5),Localeid I)
INSERT INTO __Locales VALUES ([ar-sa],1025)
INSERT INTO __Locales VALUES ([bg-bg],1026)
INSERT INTO __Locales VALUES ([ca-es],1027)
INSERT INTO __Locales VALUES ([zh-tw],1028)
INSERT INTO __Locales VALUES ([cs-cz],1029)
INSERT INTO __Locales VALUES ([da-dk],1030)
INSERT INTO __Locales VALUES ([de-de],1031)
INSERT INTO __Locales VALUES ([el-gr],1032)
INSERT INTO __Locales VALUES ([en-us],1033)
INSERT INTO __Locales VALUES ([es-es],1034)
INSERT INTO __Locales VALUES ([fi-fi],1035)
INSERT INTO __Locales VALUES ([fr-fr],1036)
INSERT INTO __Locales VALUES ([he-il],1037)
INSERT INTO __Locales VALUES ([hu-hu],1038)
INSERT INTO __Locales VALUES ([is-is],1039)
INSERT INTO __Locales VALUES ([it-it],1040)
INSERT INTO __Locales VALUES ([ja-jp],1041)
INSERT INTO __Locales VALUES ([ko-kr],1042)
INSERT INTO __Locales VALUES ([nl-nl],1043)
INSERT INTO __Locales VALUES ([nb-no],1044)
INSERT INTO __Locales VALUES ([pl-pl],1045)
INSERT INTO __Locales VALUES ([pt-br],1046)
INSERT INTO __Locales VALUES ([ro-ro],1048)
INSERT INTO __Locales VALUES ([ru-ru],1049)
INSERT INTO __Locales VALUES ([hr-hr],1050)
INSERT INTO __Locales VALUES ([sk-sk],1051)
INSERT INTO __Locales VALUES ([sq-al],1052)
INSERT INTO __Locales VALUES ([sv-se],1053)
INSERT INTO __Locales VALUES ([th-th],1054)
INSERT INTO __Locales VALUES ([tr-tr],1055)
INSERT INTO __Locales VALUES ([ur-pk],1056)
INSERT INTO __Locales VALUES ([id-id],1057)
INSERT INTO __Locales VALUES ([uk-ua],1058)
INSERT INTO __Locales VALUES ([be-by],1059)
INSERT INTO __Locales VALUES ([sl-si],1060)
INSERT INTO __Locales VALUES ([et-ee],1061)
INSERT INTO __Locales VALUES ([lv-lv],1062)
INSERT INTO __Locales VALUES ([lt-lt],1063)
INSERT INTO __Locales VALUES ([fa-ir],1065)
INSERT INTO __Locales VALUES ([vi-vn],1066)
INSERT INTO __Locales VALUES ([hy-am],1067)
INSERT INTO __Locales VALUES ([az-az],1068)
INSERT INTO __Locales VALUES ([eu-es],1069)
INSERT INTO __Locales VALUES ([mk-mk],1071)
INSERT INTO __Locales VALUES ([af-za],1078)
INSERT INTO __Locales VALUES ([ka-ge],1079)
INSERT INTO __Locales VALUES ([fo-fo],1080)
INSERT INTO __Locales VALUES ([hi-in],1081)
INSERT INTO __Locales VALUES ([ms-my],1086)
INSERT INTO __Locales VALUES ([kk-kz],1087)
INSERT INTO __Locales VALUES ([ky-kg],1088)
INSERT INTO __Locales VALUES ([sw-ke],1089)
INSERT INTO __Locales VALUES ([uz-uz],1091)
INSERT INTO __Locales VALUES ([tt-ru],1092)
INSERT INTO __Locales VALUES ([pa-in],1094)
INSERT INTO __Locales VALUES ([gu-in],1095)
INSERT INTO __Locales VALUES ([ta-in],1097)
INSERT INTO __Locales VALUES ([te-in],1098)
INSERT INTO __Locales VALUES ([kn-in],1099)
INSERT INTO __Locales VALUES ([mr-in],1102)
INSERT INTO __Locales VALUES ([sa-in],1103)
INSERT INTO __Locales VALUES ([mn-mn],1104)
INSERT INTO __Locales VALUES ([gl-es],1110)
INSERT INTO __Locales VALUES ([ko-in],1111)
INSERT INTO __Locales VALUES ([sy-sy],1114)
INSERT INTO __Locales VALUES ([di-mv],1125)
INSERT INTO __Locales VALUES ([iv-iv],127)
INSERT INTO __Locales VALUES ([ar-iq],2049)
INSERT INTO __Locales VALUES ([zh-cn],2052)
INSERT INTO __Locales VALUES ([de-ch],2055)
INSERT INTO __Locales VALUES ([en-gb],2057)
INSERT INTO __Locales VALUES ([es-mx],2058)
INSERT INTO __Locales VALUES ([fr-be],2060)
INSERT INTO __Locales VALUES ([it-ch],2064)
INSERT INTO __Locales VALUES ([nl-be],2067)
INSERT INTO __Locales VALUES ([nn-no],2068)
INSERT INTO __Locales VALUES ([pt-pt],2070)
INSERT INTO __Locales VALUES ([sr-sp],2074)
INSERT INTO __Locales VALUES ([sv-fi],2077)
INSERT INTO __Locales VALUES ([ms-bn],2110)
INSERT INTO __Locales VALUES ([ar-eg],3073)
INSERT INTO __Locales VALUES ([zh-hk],3076)
INSERT INTO __Locales VALUES ([de-at],3079)
INSERT INTO __Locales VALUES ([en-au],3081)
INSERT INTO __Locales VALUES ([fr-ca],3084)
INSERT INTO __Locales VALUES ([ar-ly],4097)
INSERT INTO __Locales VALUES ([zh-sg],4100)
INSERT INTO __Locales VALUES ([de-lu],4103)
INSERT INTO __Locales VALUES ([en-ca],4105)
INSERT INTO __Locales VALUES ([es-gt],4106)
INSERT INTO __Locales VALUES ([fr-ch],4108)
INSERT INTO __Locales VALUES ([ar-dz],5121)
INSERT INTO __Locales VALUES ([zh-mo],5124)
INSERT INTO __Locales VALUES ([de-li],5127)
INSERT INTO __Locales VALUES ([en-nz],5129)
INSERT INTO __Locales VALUES ([es-cr],5130)
INSERT INTO __Locales VALUES ([fr-lu],5132)
INSERT INTO __Locales VALUES ([ar-ma],6145)
INSERT INTO __Locales VALUES ([en-ie],6153)
INSERT INTO __Locales VALUES ([es-pa],6154)
INSERT INTO __Locales VALUES ([fr-mc],6156)
INSERT INTO __Locales VALUES ([ar-tn],7169)
INSERT INTO __Locales VALUES ([en-za],7177)
INSERT INTO __Locales VALUES ([es-do],7178)
INSERT INTO __Locales VALUES ([ar-om],8193)
INSERT INTO __Locales VALUES ([en-jm],8201)
INSERT INTO __Locales VALUES ([es-ve],8202)
INSERT INTO __Locales VALUES ([ar-ye],9217)
INSERT INTO __Locales VALUES ([en-cb],9225)
INSERT INTO __Locales VALUES ([es-co],9226)
INSERT INTO __Locales VALUES ([ar-sy],10241)
INSERT INTO __Locales VALUES ([en-bz],10249)
INSERT INTO __Locales VALUES ([es-pe],10250)
INSERT INTO __Locales VALUES ([ar-jo],11265)
INSERT INTO __Locales VALUES ([en-tt],11273)
INSERT INTO __Locales VALUES ([es-ar],11274)
INSERT INTO __Locales VALUES ([ar-lb],12289)
INSERT INTO __Locales VALUES ([en-zw],12297)
INSERT INTO __Locales VALUES ([es-ec],12298)
INSERT INTO __Locales VALUES ([ar-kw],13313)
INSERT INTO __Locales VALUES ([en-ph],13321)
INSERT INTO __Locales VALUES ([es-cl],13322)
INSERT INTO __Locales VALUES ([ar-ae],14337)
INSERT INTO __Locales VALUES ([es-uy],14346)
INSERT INTO __Locales VALUES ([ar-bh],15361)
INSERT INTO __Locales VALUES ([es-py],15370)
INSERT INTO __Locales VALUES ([ar-qa],16385)
INSERT INTO __Locales VALUES ([es-bo],16394)
INSERT INTO __Locales VALUES ([es-sv],17418)
INSERT INTO __Locales VALUES ([es-hn],18442)
INSERT INTO __Locales VALUES ([es-ni],19466)
INSERT INTO __Locales VALUES ([es-pr],20490)

ENDFUNC

ENDDEFINE



#IF .F.

*** This block of code generates the INSERT statements and CREATE CURSOR
*** commands for te LocaleLookupTable() method
*** You can simply paste this text into the method.
o = CREATEOBJECT("localeInfo")
o.GetLocales()

lcOutput = "CREATE CURSOR __Locales ( Locale C(4),Localeid I)" + CHR(13) 
SCAN
   lcOutput = lcOutput +  ;
     "INSERT INTO __Locales VALUES ([" + Locale + "]," + TRANSFORM(LocaleId) + ")" + CHR(13)
ENDSCAN

_ClipText = lcOutput

RETURN
#ENDIF