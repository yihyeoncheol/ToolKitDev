//
//  SettingScene.m
//  ToolKitDev
//
//  Created by yihyeoncheol on 2018. 3. 12..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "SettingScene.h"

@interface SettingScene ()

@end

@implementation SettingScene

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Button *closeButton = [Button buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage imageNamed:@"ic_close_36pt"] forState:UIControlStateNormal];
    [closeButton setEventTouchUpInsideHandler:^(Button *button) {
        [self.sceneDirector dismissScene:self message:nil];
    }];
    self.navigationBar.rightButtonItems = @[closeButton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
