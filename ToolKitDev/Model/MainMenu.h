//
//  MainMenu.h
//  ToolKitDev
//
//  Created by Infomax on 2018. 3. 15..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import <ToolKit/ToolKit.h>

@interface MainMenu : Model <Menu>

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *sceneName;
@property(nonatomic,strong)NSString *sceneNumber;
@property(nonatomic,strong)NSNumber *level;;
@property(nonatomic,strong)NSNumber *type;
@property(nonatomic,strong)NSArray *subMenu;

@end

