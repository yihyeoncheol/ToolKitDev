/****************************************************************************/
/*  파일명  :  krxclimst.h                                                   */
/*  설   명 :  국내 선물옵션 클라이언트 코드 마스터                          */
/*  날   짜 :  2007.06.08                                                    */
/*  작   성 :  ITCastle Co.                                                  */
/****************************************************************************/

#ifndef _KRXCLIMST_H_
#define _KRXCLIMST_H_

/*--------------------------------------------------------------------------*/
/* 국내 선물옵션 클라이언트 코드 마스터 - 각항목뒤 한자리 ',' 마지막 '\n'   */
/*--------------------------------------------------------------------------*/
typedef struct _CLIFOMASTER {
	char    mkcode        [ 2+1];   /* 마켓코드                             */
    /* 01:주식 03:KOSPI                     */
    /* 04:STAR 05:금리 06:통화 07:현물      */
	char    dscode        [ 2+1];   /* 거래대상코드(대상자산ID)             */
    /* 01:KOSPI 03:STAR                     */
    /* 10:KBSTAR 11:SEC 12:SKT 13:POSCO     */
    /* 15:KEPCO 16:HDM                      */
    /* 60:CD 61:KTB 62:MSB 63:5TB 75:USD    */
    /* 76:JPY 77:EUR 85:GOLD 86:LH 64:LKTB  */
	char    dscodeid      [ 8+1];   /* 대상코드ID(품목명)                   */
    /* KOSPI,STAR,KBSTAR,SEC,SKT,POSCO      */
    /* KEPCO,HDM,CD,KTB,MSB,5TB,USD,JPY,EUR */
    /* GOLD,LH,LKTB                         */
	char    spgubun       [ 3+1];   /* 파생상품구분                         */
    /* 001:콜 002:풋 004:선물 005:현물      */
    /* 005:스프레드                         */
	char    optkind       [ 1+1];   /* 콜풋구분 0:옵션아님 2:콜 3:풋        */
	char    series        [ 8+1];   /* 거래소 종목코드                      */
	char    series_k      [30+1];   /* 당사 국문 종목코드                   */
	char    series_e      [30+1];   /* 당사 영문 종목코드                   */
	char    jmname_k      [30+1];   /* 국문 종목명                          */
	char    jmname_e      [30+1];   /* 영문 종목명                          */
	char    expyear       [ 4+1];   /* 만기년                               */
	char    expmonth      [ 2+1];   /* 만기월                               */
	char    remdays       [ 3+1];   /* 잔존일수                             */
	char    strkpx        [10+1];   /* 행사가격                             */
	char    atmpart       [ 1+1];   /* ATM여부                              */
    /* 0:ATM 아님 1:ATM                     */
	char    maxpx         [10+1];   /* 상한가                               */
	char    minpx         [10+1];   /* 하한가                               */
    
} CLIFOMASTER;

#define FOMASTER_NAME "FoMaster.dat.org"
#define FLEXMASTER_NAME "FlexMaster.dat"

#endif
