#import "NHFJobAppVersion.h"
#import "VERSION.h"

@implementation NHFJobAppVersion
{
    NSObject* appinfo;
}

- (void)dealloc
{
}

- (void)execute
{
    [super execute];
    
    NSString *ver_opt = @"1";
    NSData *data = [ver_opt dataUsingEncoding:NSUTF8StringEncoding];
    
    Request *request = [Request new];
    [request setCommand:H_CMD_APP_INFO];
    [request setBytes:[data bytes] length:data.length];
    Block *block = [Block new];
    
    [request setBlock:block];
    
    
    
    [[NHFTransferRequest defaultCenter] dataTaskWithRequest:request
                                                   receiver:self
                                                   selector:@selector(receiveAppVersion:)];
}

//-(BOOL)asynchronous
//{
//    return YES;
//}

- (void)receiveAppVersion:(Response*)response
{
    
//    VERSION_OUT _VERSION_OUT;
//
//    memcpy(&_VERSION_OUT, [data bytes], sizeof(VERSION_OUT));
    
    //    NSString *version = byteToString(_VERSION_OUT.version, sizeof(_VERSION_OUT.version));
    //    NSString *level1 = byteToString(_VERSION_OUT.level1, sizeof(_VERSION_OUT.level1));
    //    NSString *level2 = byteToString(_VERSION_OUT.level2, sizeof(_VERSION_OUT.level2));
    //    NSString *chng_dt = byteToString(_VERSION_OUT.chng_dt, sizeof(_VERSION_OUT.chng_dt));
    
    //    [retValue setValue:version forKey:@"version"];
    //    [retValue setValue:level1 forKey:@"level1"];
    //    [retValue setValue:level2 forKey:@"level2"];
    //    [retValue setValue:chng_dt forKey:@"chng_dt"];
    
    // [self requestEncryptKey];
    
//    [self stop];
}

@end
