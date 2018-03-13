//
//  TKDMenuScene.m
//  ToolKitDev
//
//  Created by Infomax on 2018. 3. 13..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "TKDMenuScene.h"

@interface TKDMenuScene ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataList;
@property(nonatomic,weak)IBOutlet TableView *tableView;
@end

@implementation TKDMenuScene

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _dataList = [NSMutableArray arrayWithArray:@[@"앨범",@"지도",@"카메라"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonTouchUpInside:(Button *)button
{
    [self.sceneDirector offMenu];
}

//@protocol UITableViewDataSource<NSObject>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = _dataList[indexPath.row];
    return cell;
}

//@protocol UITableViewDelegate<NSObject, UIScrollViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self.sceneDirector openScene:@"ImagePickerController" message:nil];
            break;
        case 1:
            [self.sceneDirector openScene:@"CameraScene" message:nil];
            break;
        case 2:
            [self.sceneDirector openScene:@"CameraScene" message:nil];
            break;
        default:
            break;
    }
    
    [self.sceneDirector offMenu];
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
