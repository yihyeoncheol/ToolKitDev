//
//  MainScene.m
//  ToolKitDev
//
//  Created by yihyencheol on 2017. 5. 14..
//  Copyright © 2017년 yihyeoncheol. All rights reserved.
//

#import "MainScene.h"

@interface MainScene ()

@end

@implementation MainScene

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)buttonTouchUpInside:(Button *)button
{
    [self.sceneDirector onMemu:NO];
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
