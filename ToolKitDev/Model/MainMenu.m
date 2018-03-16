//
//  MainMenu.m
//  ToolKitDev
//
//  Created by Infomax on 2018. 3. 15..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import "MainMenu.h"

@implementation MainMenu

@synthesize accessLevel ;
@synthesize openType;

- (void)dealloc
{
    self.title = nil;
    self.sceneName= nil;
    self.sceneNumber= nil;
    self.level = nil;
    self.type = nil;
    self.subMenu= nil;
}


#pragma menu
- (MenuAccessLevel)accessLevel
{
    switch (self.level.integerValue) {
        case 0:return MenuAccessLevelNormal; //비로그인
        case 1:return MenuAccessLevelLogin;
        case 2:return MenuAccessLevelSpecial;
    }
    return MenuAccessLevelNormal;
}

- (MemuOpenType)openType
{
  NSInteger type =   self.type.integerValue;
    switch (type) {
        case 0:return MemuOpenTypeDefault;
        case 1:return MemuOpenTypePush;
        case 2:return MemuOpenTypePresent;
        case 3:return MemuOpenTypePopup;
    }
    return MemuOpenTypeDefault;
}

- (Message*)message
{
    return nil;
}

@end
