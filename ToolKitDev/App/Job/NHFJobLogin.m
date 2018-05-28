//
//  NHFJobLogin.m
//  NHFuturesScreenBrowser
//
//  Created by jaimoon seo on 2018. 4. 15..
//  Copyright © 2018년 infomax. All rights reserved.
//

#import "NHFJobLogin.h"
#import "NHFLoginProcessor.h"
#import "NHFNavigationController.h"
#import "NHFLoginMain.h"
@implementation NHFJobLogin

- (void)run
{
    [super run];
    // NSString *sCPW = @"1230";
    // NSString *sID = @"sezeroot";
    // NSString *sPW = @"1830";
    // NSString *sCPW = @"1230";
    
    
    // TODO 자동로그인 체크
    __weak NHFJobLogin *weakself = self;
    
    if (YES) {
        NHFLoginMain *loginMain = [NHFLoginMain new];
        [loginMain setActionBlock:^(NSObject *obj)
        {
            NSDictionary *current = (NSDictionary*)obj;
            if(SAME_ACTION(@"CERT_LOGIN", current)){

                NSString *sID = current[@"id"];
                NSString *sPW = current[@"pw"];
                NSString *certPasswd = @"1230";

                [NHFLoginProcessor login:sID passwd:sPW certPasswd:certPasswd complete:^(BOOL complete,NSString *message) {
                    if (complete) {
                        [weakself stop];
                    }else{
                        if (message) {
                        }
                    }
                }];

            }else if(SAME_ACTION(@"SISE_LOGIN", current)){

                NSString *sID = current[@"id"];
                NSString *sPW = current[@"pw"];
                NSString *certPasswd = @"1230";

            [NHFLoginProcessor login:sID passwd:sPW certPasswd:certPasswd complete:^(BOOL complete,NSString *message) {
                    if (complete) {
                        [weakself stop];
                    }else{
                        if (message) {
                        }
                    }
                }];
            }
        }];
        
        [NHFNavigationController NavigateScreen:loginMain Animaition:nil];
        
    }else{
        
        NSString *sID = @"mtstest";
        NSString *sPW = @"1230";
        
        [NHFLoginProcessor login:sID passwd:sPW  complete:^(BOOL complete,NSString *message) {
            if (complete) {
                [weakself stop];
            }else{
                if (message) {
                }
            }
        }];
    }
}


@end

// [self requestHCQ01112];
