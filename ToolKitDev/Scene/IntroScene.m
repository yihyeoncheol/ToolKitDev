//
//  IntroScene.m
//  ToolKitDev
//
//  Created by Infomax on 2018. 9. 19..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "IntroScene.h"

@interface IntroScene ()
@property(nonatomic,strong)NSArray *list;
@end

@implementation IntroScene

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    
    self.list = @[@{@"UI":@"Grid",              @"Class":@"GridTestScene"},
                  @{@"UI":@"Alert",             @"Class":@"AlertTestScene"},
                  @{@"UI":@"Calendar",          @"Class":@"GridTestScene"},
                  @{@"UI":@"SimpleUI",          @"Class":@"SimpleUIScene"},
                  @{@"UI":@"TextField",         @"Class":@"GridTestScene"},
                  @{@"UI":@"Toast",             @"Class":@"GridTestScene"},
                  @{@"UI":@"Grid",              @"Class":@"GridTestScene"}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonTouchUpInside:(Button *)button
{
    [Alert alertWithTitle:nil message:@"test" handler:^(BOOL cancelled, NSInteger buttonIndex) {
        
    } cancelButtonTitle:@"취소" otherButtonTitles:@"버튼1",@"button",nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(cell== nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    NSString *text = self.list[indexPath.row][@"UI"];
    
    cell.textLabel.text = text;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = self.list[indexPath.row][@"Class"];
    [self.sceneDirector pushScene:text message:nil];
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
