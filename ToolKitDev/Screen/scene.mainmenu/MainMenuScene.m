//
//  MainMenuScene.m
//  ToolKitDev
//
//  Created by Infomax on 2018. 3. 13..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "MainMenuScene.h"
#import <Photos/PHPhotoLibrary.h>
#import "MainMenu.h"

@interface MainMenuScene ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) MainMenu *menuList;
@property(nonatomic,weak)IBOutlet TableView *tableView;
@end

@implementation MainMenuScene

- (void)dealloc
{
    self.menuList = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if(self.menuData){
        _menuList = [[MainMenu alloc]initWithData:self.menuData];
    }
    
    
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
    return _menuList.submenu.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    MainMenu *menu = _menuList.submenu[indexPath.row];
    cell.textLabel.text = menu.title;
    
    return cell;
}

//@protocol UITableViewDelegate<NSObject, UIScrollViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MainMenu *menu = _menuList.submenu[indexPath.row];
    switch (menu.opentype.integerValue) {
        case 0:[self.sceneDirector openScene:menu.scene message:nil];break;
        case 1:[self.sceneDirector pushScene:menu.scene message:nil];break;
        case 2:[self.sceneDirector presentScene:menu.scene message:nil];break;
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
