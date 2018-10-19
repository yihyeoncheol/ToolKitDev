//
//  GridTestScene.m
//  ToolKitDev
//
//  Created by Infomax on 2018. 10. 19..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "GridTestScene.h"

@interface GridTestScene ()
@property(nonatomic,strong)IBOutlet Grid *grid;
@end

@implementation GridTestScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
        _grid.rowHeight = 50;
    
        [_grid.rootNode addCol:100];
    
        GridNode *calNode = [_grid.rootNode addCol:100];
        [calNode addRow:25];
    
        calNode = [calNode addRow:25];
        [calNode addCol:50];
        [calNode addCol:50];
    
        [_grid.rootNode addCol:50];
        [_grid.rootNode addCol:50];
        [_grid.rootNode addCol:50];
        [_grid.rootNode addCol:50];
        [_grid.rootNode addCol:50];
        [_grid.rootNode addCol:50];
        [_grid.rootNode addCol:50];
        _grid.fixIndex = 1;//
        [_grid layoutUpdate];
    
        NSArray *subGridNode = [_grid.rootNode subGridNode];
    
        NSLog(@"%ld",subGridNode.count);
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
