//
//  NHFTCPService.m
//  ToolKitDev
//
//  Created by yihyeoncheol on 2018. 5. 8..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "NHFTCPService.h"
#import "COMMHAEDER.h"
#import "KSclient.h"
@interface NHFTCPService ()
{
    KS_CLIENT_CTX _ks_ctx;
}

@property(nonatomic,strong)NSMutableDictionary *packetData;
@end

@implementation NHFTCPService

- (int)uniqKey
{
    static int _uniqkey = 2;
    _uniqkey ++;
    if(_uniqkey > 128){
        _uniqkey = 2;
    }
    return _uniqkey;
}

- (id)init
{
    self = [super init];
    if (self) {
        _packetData = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (NSData*)makeCommand:(char)command data:(NSData*)data viewKey:(int)viewKey
{
    Request *request = [Request new];
    request.command = command;
    
    switch (command ) {
        case H_CMD_SET_KEY:  //암호화키..요청
        {
            int ret = 0;
            ks_uint8 keyInitOut[1024] = {0x00,};
            ks_uint16 keyInitOutLen = 0;
            
            memset(keyInitOut, 0x00, sizeof(keyInitOut));
            
            ret = KS_Encode_KeyInit_Token(&_ks_ctx,
                                          keyInitOut,
                                          &keyInitOutLen,
                                          sizeof(keyInitOut));
            if(ret < 0 ){
                return nil;
            }
            data = [NSData dataWithBytes:keyInitOut length:keyInitOutLen];
        }
            break;
        case H_CMD_FILE:
            request.name = @"GETFILE";
            break;
        case H_CMD_APP_INFO:
            break;
        default:
            break;
    }
    
    int dataSize = (int)[data length];
    NSData *packetData = [self makePacket:request
                                     flag:H_SEQ_LAST
                                     data:(char*)[data bytes]
                               dataOffset:0
                                 dataSize:dataSize
                              dataOrgSize:dataSize
                                  dataCnt:0
                                  viewKey:viewKey];
    return packetData;
}

+ (int)sendRequest:(Request *)request;
{
    return  -1;
}


/*
 헤더 세팅..
 */

- (NSData*)makePacket:(Request *)packet flag:(char)packetFlag data:(char *)szData dataOffset:(int)dataOffset dataSize:(int)dataSize dataOrgSize:(int)dataOrgSize dataCnt:(int)dataCnt viewKey:(int)viewKey
{
    COMMHAEDER _COMMHAEDER;
    
    int HEADER_SIZE  = sizeof(COMMHAEDER);
    
    NSString *_ip = @"";//DEVICE.IP;
    NSString *_id = @"";//USERSESSION.ID;
    NSString *empNo = @"";//USERSESSION.info.empno;
    if (empNo == nil) {
        empNo = @"";
    }
    
    memset(&_COMMHAEDER, 0x20, HEADER_SIZE);
    
    NSInteger packetLength = HEADER_SIZE + dataSize - sizeof(_COMMHAEDER.len);
    _COMMHAEDER.len[0] = packetLength / 256;
    _COMMHAEDER.len[1] = packetLength % 256;
    
    //    _COMMHAEDER.flag[0] = 0x00;
    _COMMHAEDER.seq[0] = packetFlag;
    
    _COMMHAEDER.cmd[0] = packet.command;
    
    stringCopy((char*)_COMMHAEDER.trcode,   packet.name);
    stringCopy((char*)_COMMHAEDER.cert,     @"");
    stringCopy((char*)_COMMHAEDER.media,    @"P");
    stringCopy((char*)_COMMHAEDER.IPAddr,   _ip);
    stringCopy((char*)_COMMHAEDER.Id,       _id);
    
    stringCopy((char*)_COMMHAEDER.EmpNo,    empNo);
    stringCopy((char*)_COMMHAEDER.filler,   @"");
    
    intToBytes((char*)_COMMHAEDER.windowid, sizeof(_COMMHAEDER.windowid), viewKey);
    
    
    
    if(packet.encrypt){
        _COMMHAEDER.flag[0] |= H_FLAG_ENCRPYTE;
    }
    
    if(packet.compress){
        _COMMHAEDER.flag[0] |= H_FLAG_COMPRESS;
    }
    
    NSMutableData *data = [NSMutableData dataWithBytes:&_COMMHAEDER length:HEADER_SIZE];
    
    NSData *bodyData = [NSData dataWithBytes:szData + dataOffset length:dataSize];
    
    
#if 0
    /*
     축약서명
     */
    if (packet.simplesign) {
        KSCertManager *certManager = [KSCertManager SharedObject];
        int signResult = 0;
        NSData *simpleSignedData = [certManager simpleSignWithSignSource:_data result:&signResult];
        if(signResult > 150){ // 150이하 1024 인증서 이므로 축약서명 하지 않음 - 12.11.22 김정문
            _cert = signResult-1; //결과값 -1 셋팅
            [_data appendData:simpleSignedData];
        }
    }
#endif
    
    //    char flag = _COMMHAEDER.flag[0];
    
    
    
    [data appendData:bodyData];
    
    return data;
}

- (NSArray*)makePacket:(Request*)packet viewKey:(int)viewKey
{
    
    NSData *bodyData = [packet fieldToData];
    
    if(packet.encrypt){
        bodyData = [self encryptData:bodyData];
    }
    
    if(packet.compress){
        bodyData = [self compressData:bodyData];
    }
    
    if (packet.command == '\0'){
        packet.command = H_CMD_DATA;
    }
    
    if (packet.simplesign) {
        
        //        KSCertManager *certManager = [KSCertManager SharedObject];
        //        int signResult = 0;
        //        NSData *simpleSignedData = [certManager simpleSignWithSignSource:_data result:&signResult];
        //        if(signResult > 150){ // 150이하 1024 인증서 이므로 축약서명 하지 않음 - 12.11.22 김정문
        //            _cert = signResult-1; //결과값 -1 셋팅
        //            [_data appendData:simpleSignedData];
        //        }
    }
    
    int HEADER_SIZE  = sizeof(COMMHAEDER);
    
    int FML_SIZE = 4096 - HEADER_SIZE;
    
    int dataLength = (int)[bodyData length]; // 전체길이...
    
    int packetSize = packet.encrypt && (dataLength > ENCRYPT_FML_SIZE) ? ENCRYPT_FML_SIZE : (dataLength > FML_SIZE ? FML_SIZE : dataLength);
    
    
    
    
    NSMutableArray *packets = [[NSMutableArray alloc]init];
    
    int len = dataLength; // 남은 사이즈
    int offset = 0;
    
    for (;len > 0;) {
        
        int remain = len - packetSize;
        
        int dataSize = MIN(packetSize, len);
        
        NSData *requestPacket = nil;;
        if (remain == 0) { //마지막
            requestPacket = [self makePacket:packet flag:H_SEQ_LAST data:(char*)[bodyData bytes]
                                  dataOffset:offset dataSize:dataSize dataOrgSize:dataLength dataCnt:0 viewKey:viewKey];
        }else if(offset == 0 &&  remain > packetSize){
            requestPacket = [self makePacket:packet flag:H_SEQ_FIRST data:(char*)[bodyData bytes]
                                  dataOffset:offset dataSize:dataSize dataOrgSize:dataLength dataCnt:0 viewKey:viewKey];
        }else{
            requestPacket = [self makePacket:packet flag:H_SEQ_MIDDLE data:(char*)[bodyData bytes]
                                  dataOffset:offset dataSize:dataSize dataOrgSize:dataLength dataCnt:0 viewKey:viewKey];
        }
        
        len -= dataSize;
        offset += dataSize;
        
        
        [packets addObject:requestPacket];
        
    }
    
    return packets;
}

/* 바디만.
 */
- (void)packetAssemble:(NSData*)packet withTag:(long)tag
{
    
    COMMHAEDER _COMMHAEDER;
    int HEADER_SIZE = sizeof(COMMHAEDER);
    
    NSData *haederData = [packet subdataWithRange:NSMakeRange(0, HEADER_SIZE)];
    memcpy(&_COMMHAEDER, [haederData bytes], sizeof(COMMHAEDER));
    
    int length = _COMMHAEDER.len[0] * 256 + _COMMHAEDER.len[1];
    length += 2;
    
    BOOL compress = (_COMMHAEDER.flag[0] & H_FLAG_COMPRESS) == H_FLAG_COMPRESS ? YES : NO;
    BOOL encrypt = (_COMMHAEDER.flag[0] & H_FLAG_ENCRPYTE) == H_FLAG_ENCRPYTE ? YES : NO;
    
    int _flag = _COMMHAEDER.flag[0];
    int _command = _COMMHAEDER.cmd[0];
    
    NSData *bodyData = [packet subdataWithRange:NSMakeRange(HEADER_SIZE, length - HEADER_SIZE)];
    
    BOOL _error = NO;
    if(((_flag & H_FLAG_ERROR) == H_FLAG_ERROR)|| _command == H_CMD_ERROR){
        _error = YES;
    }else{
        _error = NO;
    }
    
    int windowid =  bytesToInt((char*)_COMMHAEDER.windowid, sizeof(_COMMHAEDER.windowid));
    //TODO 에러 처리 해야함.
    // 밑에서 처리해야해~
    if (_error) {
        [self onSystemError:bodyData withViewKey:windowid];
        return;
    }
    
    
    if (encrypt) {
        bodyData = [self decryptData:bodyData];
    }
    
    if (compress) {
        bodyData = [self decompressData:bodyData];
    }
    
    
    
    NSString *sKey = [NSString stringWithFormat:@"%d%@",
                      bytesToInt((char*)_COMMHAEDER.windowid, sizeof(_COMMHAEDER.windowid)),
                      byteToString((char*)_COMMHAEDER.cmd, sizeof(_COMMHAEDER.cmd))];
    
    
    
    
    NSMutableData *originPacket = nil;
    
    if(![[_packetData allKeys]containsObject:sKey]){
        
        originPacket = [[NSMutableData alloc]init];
        [originPacket appendData:haederData];
        [originPacket appendData:bodyData];
        [_packetData setObject:originPacket forKey:sKey];
        
    }else{
        
        originPacket = [_packetData objectForKey:sKey];
        [originPacket appendData:bodyData];
    }
    
    if(_COMMHAEDER.seq[0] == H_SEQ_LAST){
        [self didReceiveData:originPacket withViewKey:windowid];
        [_packetData removeObjectForKey:sKey];
    }
    
}

- (void)didReceiveData:(NSData *)data withViewKey:(int)viewKey
{
    
#if TARGET_IPHONE_SIMULATOR
    wirteHexLog((char*)[data bytes] ,(int)[data length]);
#endif
    
    
    COMMHAEDER _COMMHAEDER;
    memcpy(&_COMMHAEDER, [data bytes], sizeof(COMMHAEDER));
    
    data = [data subdataWithRange:NSMakeRange(sizeof(COMMHAEDER), data.length - sizeof(COMMHAEDER))];
    
    
    if(data.length == 0){
        return;
    }
    
    NSString *trcode = byteToString(_COMMHAEDER.trcode,sizeof(_COMMHAEDER.trcode));
    
    
    switch (_COMMHAEDER.cmd[0]) {
        case H_CMD_REAL:        // 실시간 수신
        {
            if([trcode isEqualToString:@"EXEC"]){
                if(_COMMHAEDER.filler[0] == 0x20){
                    [self onRealData:data withViewKey:viewKey];
                }else{
                    [self onRealData:data withViewKey:viewKey];
                }
            }else{
                [self onRealData:data withViewKey:viewKey];
            }
        }
            break;
        case H_CMD_MESSAGE:     //TR 메세지
            [self onMessageData:data withViewKey:viewKey];
            break;
        case H_CMD_TRAN_CLEAR:  //TR 해제
        {
            [self onReleaseData:viewKey];
            
//            NSString *cmd = byteToString(_COMMHAEDER.trcode, sizeof(_COMMHAEDER.trcode));
            
        }
            break;
        case H_CMD_DATA:        //데이터 송/수신
            [self onRequestData:data withViewKey:viewKey];
            break;
        case H_CMD_SET_KEY:
            [self receiveEncryptKey:data];
            break;
        case H_CMD_VERSION_INFO:
        case H_CMD_FILE:
        case H_CMD_APP_INFO:
            [self onCommandData:data withViewKey:viewKey];
            break;
        default:
            [self onRequestData:data withViewKey:viewKey];
            break;
    }
}

- (void)packetProcessReadData:(NSData *)data withTag:(long)tag
{
#if TARGET_IPHONE_SIMULATOR
    //    wirteHexLog((char*)[data bytes] ,(int)[data length]);
#endif
    
    int len = (int)data.length ;
    
    PacketContext pctx = self.packetContext;
    pctx.pLen = len;
    int pos  = 0;
    
    BOOL condition = YES;
    while(condition){
        switch(pctx.state ){
            case 0: // 첫패킷
            {
                COMMHAEDER _COMMHAEDER;
                memcpy(&_COMMHAEDER, [data bytes] + pos, sizeof(COMMHAEDER));
                
                int length = _COMMHAEDER.len[0] * 256 ;
                length += _COMMHAEDER.len[1];;
                
                length += 2; //
                
                pctx.state = 1;
                pctx.rLen = length; //패킷 사이즈
                pctx.len = 0;
                memset(self->packetBuffer, 0x20, pctx.rLen); //초기화
            }
                break;
                
            case 1: // add
            {
                int nLen = MIN(pctx.rLen, pctx.pLen); //plen 전체..
                memcpy(self->packetBuffer + pctx.len, (char*)[data bytes] + pos, nLen);
                
                pctx.rLen -= nLen;
                pctx.len += nLen;
                pos += nLen;
                
                if( pctx.rLen == 0 ){  // 패킷끝
                    pctx.state = 2;
                }else{
                    condition = NO;
                    self.packetContext = pctx;
                }
            }
                break;
                
            case 2: // 끝
            {
                NSData*decodeData = [NSData dataWithBytes:self->packetBuffer length:pctx.len];
                
                COMMHAEDER _COMMHAEDER;
                memcpy(&_COMMHAEDER, [decodeData bytes], sizeof(COMMHAEDER));
                
                int length = _COMMHAEDER.len[0] * 256 ;
                length += _COMMHAEDER.len[1];;
                
                
                [self packetAssemble:decodeData withTag:tag];
                
                
                condition = !(pos == len);
                pctx.pLen = abs(len - pos);
                
                pctx.state = 0;
                pctx.len = 0;
                pctx.rLen = 0;
                self.packetContext = pctx;
            }
                break;
        }
    }
}

#pragma mark -
- (void)receiveEncryptKey:(NSData*)data
{
    int ret = KS_Decode_KeyFinal_Token(&_ks_ctx, (unsigned char*)[data bytes], (unsigned short)[data length]);
    if(ret < 0){
        if(ret == -100){ // 결과가 -100일때 키 재요청 (모듈 스팩)
//            [self sendCommandRequest:H_CMD_SET_KEY data:nil receiver:nil];
        }
        return;
    }
    
//    [self onCommandData:data command:H_CMD_SET_KEY];
}

#pragma mark - data decrypte & decompress
- (NSData*)encryptData:(NSData*)originData
{
    
    ks_uint8 encOut[8192] = {0x00,};
    ks_uint32 encOutLen = 0;
    int ret = KS_Encrypt_Message(&_ks_ctx,
                                 (ks_uint8*)encOut,
                                 (ks_uint32*)&encOutLen,
                                 sizeof(encOut),
                                 (ks_uint8*)[originData bytes],
                                 (ks_uint32*)[originData length]);
    if(ret < 0) {
        NSLog(@"KS_Encrypt_Message failed: code[%d]\n", ret);
        return nil;
    }
    
    NSData *encryptData = [[NSData alloc]initWithBytes:encOut length:encOutLen];
    return encryptData;
}

- (NSData*)decryptData:(NSData*)encryteData
{
    ks_uint8 decOut[8192] = {0x00,};
    ks_uint32 decOutLen = 0;
    int ret = KS_Decrypt_Message(&_ks_ctx,
                                 decOut,
                                 &decOutLen,
                                 sizeof(decOut),
                                 (unsigned char*)[encryteData bytes],
                                 (ks_uint32*)[encryteData length]);
    
    if(ret < 0) {
        //        NSLog(WFCOM, @"KS_Decrypt_Message failed: code[%d]\n", ret);
        return nil;
    }
    
    NSData *decryptData = [[NSData alloc]initWithBytes:decOut length:decOutLen];
    return decryptData;
}

- (NSData*)compressData:(NSData*)originData
{
    return originData;//[originData zlibDeflate];
}

- (NSData*)decompressData:(NSData*)compressData
{
    return compressData;//[compressData zlibInflate];
}
@end
