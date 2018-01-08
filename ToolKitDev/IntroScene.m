//
//  IntroScene.m
//  ToolKitDev
//
//  Created by yihyencheol on 2017. 5. 6..
//  Copyright © 2017년 yihyeoncheol. All rights reserved.
//

#import "IntroScene.h"
//#import <ToolKit/ImagePickerController.h>
@interface IntroScene() <HTTPManagerDelegate,DataGridDelegate>
@property(nonatomic,weak)IBOutlet Button *button;
@property(nonatomic,weak)IBOutlet DataGrid *dataGrid;
@end

@implementation IntroScene

- (void)dealloc
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DataGridStructure *structure = [DataGridStructure structure];
    structure.columWidths = @[@(100),@(50),@(50),@(100),@(50),@(150),@(50)];
    structure.fixColumIndex = 3;
    structure.cells = @[[Cell cellWithHeigth:40 colums:@[[Colum columWithText:@"1"],
                                                         [Colum columWithText:@"2"],
                                                         [Colum columWithText:@"3"],
                                                         [Colum columWithText:@"4"],
                                                         [Colum columWithText:@"5"],
                                                         [Colum columWithText:@"6"],
                                                         [Colum columWithText:@"7"],]]];
    _dataGrid.structure = structure;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)grid:(DataGrid *)grid gridTable:(GridTable *)cell cellDataForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)grid:(DataGrid *)grid numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (void)buttonTouchUpInside:(Button *)button
{
    
//    [self.sceneDirector openScene:@"MainScene" message:nil];
    
//    HTTPRequest *request = [HTTPRequest request];
//
//    request.url = @"https://www.naver.com/";
//    [HTTPManager request:request delegate:self];
    
//    ImagePickerController * picker = [[ImagePickerController alloc]init];
    [self.sceneDirector onMemu:YES];
    
//    [[self sceneDirector]  presentViewController:picker animated:NO completion:nil];
//    [[self sceneDirector] openScene:@"MainScene" message:nil];
//    [Alert alertWithTitle:@"buttonTouchUpInside" message:@"buttonTouchUpInside" handler:nil cancelButtonTitle:@"취소" otherButtonTitles:nil];
}

- (void)connectionDidReceiveResponse:(HTTPResponse *)response
{
    
    Model *model = [Model modelWithData:response.data];
    [self.sceneDirector openScene:@"MainScene" message:nil];
}

- (void)httpRequest:(HTTPRequest*)request connectionDidFailWithError:(NSError *)error
{
    
}

@end
