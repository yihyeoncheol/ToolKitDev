//
//  NHFTCPService.h
//  ToolKitDev
//
//  Created by yihyeoncheol on 2018. 5. 8..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import <ToolKit/ToolKit.h>

#define     H_FLAG_ENCRPYTE         0x01 //  암호화
#define     H_FLAG_COMPRESS         0x02 //  압축
#define     H_FLAG_ERROR            0x04 //  에러

//         /* Status Flag (head.seq[0])*/
#define     H_SEQ_FIRST             'F'    //  데이터 처음
#define     H_SEQ_MIDDLE            'M'    //  데이터 중간
#define     H_SEQ_LAST              'L'    //  데이터 마지막
//
//         /* Status Flag (head.cmd[0])*/
#define     H_CMD_REAL_SET          'S'    //  실시간 등록
#define     H_CMD_REAL_CLEAR        'B'    //  실시간 해제
#define     H_CMD_REAL              'C'    //  실시간 수신
#define     H_CMD_DATA              'D'    //  데이터 송/수신
#define     H_CMD_MESSAGE           'M'    //  TR 메세지
#define     H_CMD_TRAN_CLEAR        'R'    //  TR 해제
#define     H_CMD_ERROR             'E'    //  에러
#define     H_CMD_LOGIN             'L'    //  로그인 등록
#define     H_CMD_CERTI             'P'    //  인증서 등록(public Key 등록)
#define     H_CMD_VERSION_INFO      'V'    //  파일 버전 리스트
#define     H_CMD_APP_INFO          'v'    //  앱 버전 정보
#define     H_CMD_FILE              'F'    //  파일 받기
#define     H_CMD_SET_KEY           'X'    //  암호화 키 요청
#define     H_CMD_ENCRYPT_HELLO     '1'    //  암호화 키 교환 시 사용(HELLO)
#define     H_CMD_ENCRYPT_ID        '2'    //  암호화 키 교환 시 사용(ID)
#define     H_CMD_ENCRYPT_PWD       '3'    //  암호화 키 교환 시 사용(PWD)
//
//         /* Status Flag (head.cert[0])*/
//         축약서명 길이 : 실제 길이 값 - 1
//         ex) 127 => 126, 128 => 127, 255 => 254, 256 => 255
//
//         /* Status Flag (head.media[0])*/
#define     H_MEDIA_IPHONE          'O'    //  iPhone
#define     H_MEDIA_ANDROID         'P'    //  Android
#define     H_MEDIA_VALUE           'V'    //  시세전용
//
//         /* Status Flag (head.IPAddr)*/
//         Local IP(Personal IP)
//         ex) 192.168.010.001 or 211.123.093.224



#define ENCRYPT_FML_SIZE    2800

@interface NHFTCPService : TransferRequest

@end
