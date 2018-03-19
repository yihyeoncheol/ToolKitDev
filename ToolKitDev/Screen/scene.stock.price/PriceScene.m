//
//  PriceScene.m
//  ToolKitDev
//
//  Created by Infomax on 2018. 3. 19..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "PriceScene.h"

@interface PriceScene ()
@property(nonatomic,weak)IBOutlet TabBar *tabBar;
@property(nonatomic,weak)IBOutlet LinkView *linkView;
@end

@implementation PriceScene

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tabBar.items = @[@"종합",@"호가",@"차트",@"체결",@"일별"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBarValueChanged:(TabBar *)tabBar
{
    switch (tabBar.selectedIndex) {
        case 0:_linkView.sceneName = @"TotalScene"; break;
        case 1:_linkView.sceneName = @"HogaScene"; break;
        case 2:_linkView.sceneName = @"FillScene"; break;
        case 3:_linkView.sceneName = @""; break;
        case 4:_linkView.sceneName = @""; break;
        default:break;
    }
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
