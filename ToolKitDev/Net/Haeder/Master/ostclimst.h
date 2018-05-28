/****************************************************************************/
/*  파일명  :  ostclimst.h                                                   */
/*  설   명 :  해외 선물 클라이언트 코드 마스터                              */
/*  날   짜 :  2006.10.09                                                    */
/*  작   성 :  ITCastle Co.                                                  */
/****************************************************************************/

#ifndef _OSTCLIMST_H_
#define _OSTCLIMST_H_

/*--------------------------------------------------------------------------*/
/* 해외 선물 클라이언트 품목 코드 마스터                                    */
/*--------------------------------------------------------------------------*/
typedef struct _OSTCLIPMMST {
    char    pmcode          [ 5];   /* 품목코드 : Comodity Code             */
    /* 품목코드+SPACE                       */
    char    pmname          [40];   /* 품목명                               */
    char    exchkind        [ 2];   /* 거래소 구분 : Kind of Exchanges      */
    /* 01:CME, 02:CBOT, 03:SGX, 04:LIFFE, 05:EUREX, 06:HKFE  */
    char    dsporder        [ 3];   /* 거래소별 품목 표시순서               */
    char    actjmcode       [10];   /* 활성종목코드(보통 최근월물)+SPACE    */
    char    jumunlimit      [ 3];   /* 주문제한폭                           */
    char    spotgubun       [ 1];   /* 현물가 계산여부-0:NO, 1:YES          */
    char    spotdecimal     [ 1];   /* 현물가 소수점정보(반올림)            */
    char    ordergubun      [ 1];   /* 주문가능여부-0:NO, 1:YES             */
    char    pmgubun         [ 3];   /* 품목구분                             */
    /* 0	CME Spot                        */
    /* 1	CME Chemicals                   */
    /* 2	CME Beef                        */
    /* 3	CME Dairy                       */
    /* 4	CME Forest                      */
    /* 5	CME Hogs                        */
    /* 6	CME Currency                    */
    /* 7	CME Index                       */
    /* 8	CME Weather                     */
    /* 9	CME Interest                    */
    /* 10	CME Lumber                      */
    /* 11	CME TRAKRS                      */
    /* 99	CME Case Index(S&P)             */
    /* 101	CBOT Agricultural               */
    /* 102	CBOT Finacials                  */
    /* 103	CBOT Index                      */
    /* 104	CBOT Metals                     */
    /* 105	CBOT MIDAM Agricultural         */
    /* 199	CBOT Cash Index(Dowjonse)       */
    /* 200	NYMEX Spot                      */
    /* 301	SGX Index                       */
    
    char    jstime          [ 4];   /* 장시작 시간                          */
    char    jetime          [ 4];   /* 장종료 시간                          */
} OSTCLIPMMST;
#define PMCODE_NAME "PMCODE.cod"

/*--------------------------------------------------------------------------*/
/* 해외 선물 클라이언트 종목 코드 마스터                                    */
/*--------------------------------------------------------------------------*/

typedef struct OSTCLIJMMST {
    char    pmcode          [ 5];   /* 품목코드 : Comodity Code             */
    /* 품목코드+SPACE                       */
    char    jmcode          [10];   /* 종목코드                             */
    /* 품목코드+월(1자리)+년(2자리)+SPACE   */
    char    exchkind        [ 2];   /* 거래소 구분 : Kind of Exchanges      */
    /* 01:CME, 02:CBOT, 03:SGX, 04:LIFFE, 05:EUREX, 06:HKFE  */
    char    jmname          [50];   /* 종목명                               */
    char    ticksize        [15];   /* Tick Size                            */
    char    tickvalue       [15];   /* Tick Value                           */
    char    dsporder        [ 2];   /* 종목별 표시순서                      */
    char    scale           [ 3];   /* 진법                                 */
    char    scalechiper     [ 2];   /* 진법 자릿수                          */
    char    decimalchiper   [ 2];   /* 소수점 자릿수                        */
    char    dispform        [ 1];   /* 거래소가격표시정보                   */
    char    pmgubun         [ 3];   /* 품목구분                             */
    char    actjmgubun      [ 1];   /* 활성종목구분-0:NO, 1:YES             */
    char    jmgubun         [ 1];   /* 선물옵션정형복합구분                 */
    /* 1:선물,2:콜옵션,3:풋옵션,4:정형복합  */
    char    lastday         [ 8];   /* 만기일                               */
    char    jandaycnt       [ 4];   /* 잔존일수                             */
    char    ordergubun      [ 1];   /* 주문가능여부-0:NO, 1:YES             */
} OSTCLIJMMST;
#define JMCODE_NAME "JMCODE.cod"

#endif
