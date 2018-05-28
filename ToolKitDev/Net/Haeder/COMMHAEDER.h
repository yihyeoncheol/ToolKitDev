//
//  COMMHAEDER.h
//  GMaxCore
//
//  Created by Infomax on 2018. 2. 6..
//  Copyright © 2018년 Infomax. All rights reserved.
//

#ifndef COMMHAEDER_h
#define COMMHAEDER_h

typedef struct COMMHAEDER{
    unsigned char len           [2];    //  Data length 몫과 나머지
    unsigned char flag          [1];    //  압축, 암호화 유무(암호화만 사용)
    unsigned char seq           [1];    //  Data의 연속 여부를 표시함(처음 'F', 중간'M', 마지막'L')
    unsigned char windowid      [1];    //  화면 ID(1-155)
    unsigned char cmd           [1];    //  command
    unsigned char trcode        [8];    //  프로그램 코드
    unsigned char cert          [1];    //  공인 인증서 사용 유무(축약서명 길이 : 실제길이값 -1)
    unsigned char media         [1];    //  매체구분('I':iPhone, 'A':Android, 'V':시세전용)
    unsigned char teamCd        [3];    //  처리지점(HTS는 space)
    unsigned char IPAddr        [15];   //  사용자 단말 IP
    unsigned char Id            [8];    //  사용자 ID
    unsigned char EmpNo         [8];    //  사용자 사번(HTS는 space)
    unsigned char filler        [4];    //  폼윈도우 핸들(Hwnd:신규추가) -> filler 로 변경함. 12.11.09 김정문 (EXEC 구분용)
    //  0x20 국내, 0x10 해외
    //국내 야간  CME PUSH : CMEX
    
}COMMHAEDER;

#endif /* COMMHAEDER_h */
