//
//  SimpleUIScene.m
//  ToolKitDev
//
//  Created by Infomax on 2018. 10. 19..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "SimpleUIScene.h"

@interface SimpleUIScene ()
@property(nonatomic,strong)IBOutlet Radio *radio;
@end

@implementation SimpleUIScene

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.radio.items = @[@"1",@"2",@"3",@"4"];
    self.radio.contentAlignment = RadioContentAlignmentHorizontal;
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
