//
//  NHFJobEncryptKey.m
//  NHFuturesScreenBrowser
//
//  Created by jaimoon seo on 2018. 4. 15..
//  Copyright © 2018년 infomax. All rights reserved.
//

#import "NHFJobEncryptKey.h"

@implementation NHFJobEncryptKey

- (void)start
{
    [super start];
    
    
//    [NHService commandRequest:H_CMD_SET_KEY data:nil receiver:nil];
}

-(void)execute
{
    [super execute];
    NSLog(@"NHFJobEncryptKey");
}
- (void)onCommandData:(id)data Command:(NSString *)command
{
    switch ([command characterAtIndex:0]) {
    case H_CMD_SET_KEY:
            [self receiveEncryptKey:data];
          break;

    }
}

- (void)receiveEncryptKey:(NSData*)data
{
    [self stop];
}
@end
