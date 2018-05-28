//
//  BAQ90004.h
//  NHFuturesScreenBrowser
//
//  Created by Infomax on 2018. 4. 11..
//  Copyright © 2018년 infomax. All rights reserved.
//

/****************************************************************************/
/*  TR CODE : BAQ90004 (장애시 인증패스 로그)                               */
/****************************************************************************/
typedef struct {
    char    userid  [  8]; /* 사용자 ID                                */
    char    clientip[ 12]; /* 비공인 IP (PC ip)                        */
    char    commonip[ 12]; /* 공인 IP                                  */
    char    cust_no [ 16]; /* 주민번호 (직원ID 사용시 "NO     ")     */
    char    errtype [  1]; /* Error처리 유형
                            "X" : 지연처리,
                            "E" : 비상처리,
                            "C" : Client 환경문제      */
    char    errcode [  4]; /* Client 환경문제시 ErrCode      */
    char    errmesg [100]; /* 에러에 따른 메시지                       */
} BAQ90004_IN;

typedef struct {
    char    logyn   [  1]; /* 정상로그 Y/N                             */
} BAQ90004_OUT;

