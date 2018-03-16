//
//  LoginScene.m
//  ToolKitDev
//
//  Created by yihyeoncheol on 2018. 3. 12..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "LoginScene.h"

@interface LoginScene ()

@property(nonatomic,weak)IBOutlet TextField *idTextField;
@property(nonatomic,weak)IBOutlet TextField *pwTextField;
@property(nonatomic,weak)IBOutlet CheckBox *idSaveCheckBox;
@end

@implementation LoginScene

- (void)dealloc
{
    self.idTextField = nil;
    self.pwTextField = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _pwTextField.targetView = self.view;
    _idTextField.targetView = self.view;
    
    NSString *loginIDSave = [self.cookie getCookie:@"login.id.save"];
    
    if ([loginIDSave isEqualToString:@"YES"]) {
        _idSaveCheckBox.on = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonTouchUpInside:(Button *)button
{
    DECLARE_BLOCK_SELF(my);
//    [LoginManager loginProcessor:@"" passwd:@"" complete:^(BOOL complete,NSString *messag) {
        [my.sceneDirector openScene:@"MainScene" message:nil];
//    }];
}

- (void)checkBoxValueChanged:(CheckBox *)checkBox
{
    [self.cookie setCookie:checkBox.on ? @"YES" : @"NO" forName:@"login.id.save"];
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
