//
//  IntroScene.m
//  ToolKitDev
//
//  Created by yihyencheol on 2017. 5. 6..
//  Copyright © 2017년 yihyeoncheol. All rights reserved.
//

#import "IntroScene.h"
//#import <ToolKit/ImagePickerController.h>
@interface IntroScene() <HTTPManagerDelegate>
@property(nonatomic,weak)IBOutlet ComboBox *combobox;

@end

@implementation IntroScene

- (void)dealloc
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _combobox.items = @[@"1",@"2",@"3"];
    _combobox.showInView = self.view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CATransition *)animation
{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;//kCATransitionFromTop;//kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom

    return transition;
}


- (void)buttonTouchUpInside:(Button *)button
{

//    [Alert alertWithTitle:@"title" message:@"message" handler:nil cancelButtonTitle:@"취소" otherButtonTitles:@"확인",nil];
    [Alert alertWithTitle:nil message:@"message" handler:nil cancelButtonTitle:@"취소" otherButtonTitles:@"확인",nil];
//    [self.sceneDirector openScene:@"MainScene" message:nil];
    
//    HTTPRequest *request = [HTTPRequest request];
//
//    request.url = @"https://www.naver.com/";
//    [HTTPManager request:request delegate:self];
    
//    ImagePickerController * picker = [[ImagePickerController alloc]init];
//    [self.sceneDirector onMemu:YES];
//    [self.sceneDirector showPopup:@"MainScene" message:nil];
//    [[self sceneDirector]  presentViewController:picker animated:NO completion:nil];
//    [[self sceneDirector] openScene:@"MainScene" message:nil];
//    [Alert alertWithTitle:@"buttonTouchUpInside" message:@"buttonTouchUpInside" handler:nil cancelButtonTitle:@"취소" otherButtonTitles:nil];
}

- (void)connectionDidReceiveResponse:(HTTPResponse *)response
{
    
    Model *model = [Model modelWithData:response.data];
    [self.sceneDirector pushScene:@"MainScene" message:nil];
}

- (void)httpRequest:(HTTPRequest*)request connectionDidFailWithError:(NSError *)error
{
    
}

@end
