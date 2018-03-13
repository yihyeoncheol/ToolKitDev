//
//  MainScene.m
//  ToolKitDev
//
//  Created by yihyencheol on 2017. 5. 14..
//  Copyright © 2017년 yihyeoncheol. All rights reserved.
//

#import "MainScene.h"

@interface MainScene ()
@property(nonatomic,weak)IBOutlet TabBar *tabBar;
@property(nonatomic,weak)IBOutlet WebBrowser *webBrowser;
@end

@implementation MainScene

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Button *menuButton = [Button buttonWithType:UIButtonTypeCustom];
    [menuButton setImage:[UIImage imageNamed:@"ic_menu_36pt"] forState:UIControlStateNormal];
    [menuButton setEventTouchUpInsideHandler:^(Button *button) {
        [self.sceneDirector onMenu];
    }];
    self.navigationBar.leftButtonItems = @[menuButton];
    
    
    Button *settingButton = [Button buttonWithType:UIButtonTypeCustom];
    [settingButton setImage:[UIImage imageNamed:@"ic_settings_36pt"] forState:UIControlStateNormal];
    [settingButton setEventTouchUpInsideHandler:^(Button *button) {
        [self.sceneDirector presentScene:@"SettingScene" message:nil];
    }];
    Button *refreshButton = [Button buttonWithType:UIButtonTypeCustom];
    [refreshButton setImage:[UIImage imageNamed:@"ic_refresh_36pt"] forState:UIControlStateNormal];
    [refreshButton setEventTouchUpInsideHandler:^(Button *button) {
        [self.webBrowser reload];
    }];
    self.navigationBar.rightButtonItems = @[settingButton,refreshButton];
    _tabBar.items = @[@"1",@"2",@"4",@"5",@"6"];
    [_webBrowser loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.naver.com"]]];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)buttonTouchUpInside:(Button *)button
{
//    [self.sceneDirector onMemu:NO];
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
