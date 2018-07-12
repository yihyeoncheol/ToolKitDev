//
//  Block+App.m
//  ToolKitDev
//
//  Created by yihyeoncheol on 2018. 6. 5..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "Block+App.h"
#import "BZQ83537.h"
@implementation Block (App)

- (NSData*)BZQ83537_IN
{
    BZQ83537_IN _IN;
    memset(&_IN, 0x20, sizeof(BZQ83537_IN));
    
    stringCopy(_IN.userid, dic_opt_string_def(self.fields,@"사용자ID", @""));
    /*
    for(Block *block in self.subBlocks){
//
    }
    */
    return [NSData dataWithBytes:&_IN length:sizeof(BZQ83537_IN)];;
}

- (void)BZQ83537_OUT:(NSData*)data
{
    BZQ83537_OUT _OUT;
    
    memcpy(&_OUT, [data bytes], sizeof(_OUT));
    [self setValue:byteToString(_OUT.custnm, sizeof(_OUT.custnm)) fieldName:@"사용자ID"];
//    Block *block = [self addBlock];
}

@end

