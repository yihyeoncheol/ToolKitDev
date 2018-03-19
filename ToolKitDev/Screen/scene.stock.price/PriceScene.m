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
@end

@implementation PriceScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tabBar.items = @[@"종합",@"호가",@"차트",@"체결",@"일별"];
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
