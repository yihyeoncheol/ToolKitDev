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

@end

@implementation LoginScene

- (void)dealloc
{
    self.idTextField = nil;
    self.pwTextField = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _pwTextField.targetView = self.view;
    _idTextField.targetView = self.view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonTouchUpInside:(Button *)button
{
    [self.sceneDirector openScene:@"MainScene" message:nil];
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
