//
//  AlertTestScene.m
//  ToolKitDev
//
//  Created by Infomax on 2018. 10. 19..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "AlertTestScene.h"

@interface AlertTestScene ()

@end

@implementation AlertTestScene

- (void)dealloc
{
    
                                               }
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)buttonTouchUpInside:(Button *)button
{
    AletCompletionHandler handle = ^(BOOL cancelled, NSInteger buttonIndex) {
        
    };
    [Alert alertWithTitle:nil message:@"alert message" handler:handle
        cancelButtonTitle:@"cancel" otherButtonTitles:@"other1",@"other2",nil];
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
