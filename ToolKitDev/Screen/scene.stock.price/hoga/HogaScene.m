//
//  HogaScene.m
//  ToolKitDev
//
//  Created by yihyeoncheol on 2018. 3. 19..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "HogaScene.h"

@interface HogaScene ()
@property(nonatomic,retain)IBOutlet Table *table;
@end

@implementation HogaScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_table createColumnWidth:@[@30,@40,@30] rowHeight:@[@10,@10,@10,@10,@10,@10,@10,@10,@10,@10] cellMerge:nil];
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
