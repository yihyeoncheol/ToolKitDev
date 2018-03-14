//
//  CameraScene.m
//  ToolKitDev
//
//  Created by yihyeoncheol on 2018. 3. 14..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "CameraScene.h"
//#import "SceneDirector.h"
@interface CameraScene ()

@end

@implementation CameraScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ;
    NSLog(@"%@",self.sceneDirector.rootController.presentedViewController);
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
