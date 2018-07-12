//
//  NHFRootController.m
//  ToolKitDev
//
//  Created by yihyeoncheol on 2018. 5. 10..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "NHFRootController.h"
//#import "JobProcessor.h"
#import "NHFJobEncryptKey.h"
#import "NHFJobAppVersion.h"
@interface NHFRootController ()
@property(nonatomic,strong)JobProcessor *processor;
@end

@implementation NHFRootController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DECLARE_WEAK_SELF(weakself);
    
    _processor = [[JobProcessor alloc]init];
    [_processor registerJobs:@[[NHFJobAppVersion new],[NHFJobEncryptKey new]] processorID:0];
    
    [[NHFTransferRequest defaultCenter] startServiceHost:@"210.183.186.82" onPort:8300 timeoutInterval:10];
    [[NHFTransferRequest defaultCenter] setSession:self.session];
    [NHFTransferRequest defaultCenter].stateHandeler = ^(ServiceState state){
            switch (state) {
                case ServiceStateConnected:
                {
                    [weakself.processor beginProcessorID:0];
                }
                    break;
                case ServiceStateReConnecting:
                    break;
                case ServiceStateDisconnected:
                    break;
                default:
                    break;
            }
    };
    
    
//    [NHFTCPService defaultCenter] startServiceHost:@"210.183.186.68"
//                          onPort:8300
//                 timeoutInterval:10
    
    
//handler:^(ServiceState state) {
//}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)runJobprosseProcessor
{
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
