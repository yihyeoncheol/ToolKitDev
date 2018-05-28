//
//  NHFJobMaster.m
//  NHFuturesScreenBrowser
//
//  Created by jaimoon seo on 2018. 4. 15..
//  Copyright © 2018년 infomax. All rights reserved.
//

#import "NHFJobMaster.h"
#import "MasterManager.h"

@interface NHFJobMaster()
@property (strong, nonatomic) MasterManager *manager;
@end

@implementation NHFJobMaster

- (void)run
{
    [super run];
    
    _manager = [[MasterManager alloc] init];
    
    NHFJobMaster* __weak weakSelf = self;
    
#if 1
    [_manager start:^(NSInteger state) {
        weakSelf.state = JOB_STATE_PROCESSING;
        if (state == -1) {
            [weakSelf stop];
        }
    }];
#else
    [_manager load:^(NSInteger state) {
        weakSelf.state = JOB_STATE_PROCESSING;
        if (state == -1) {
            [weakSelf stop];
        }
    }];
#endif
}
@end
