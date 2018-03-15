//
//  MainMenu.h
//  ToolKitDev
//
//  Created by Infomax on 2018. 3. 15..
//  Copyright © 2018년 yihyeoncheol. All rights reserved.
//

#import <ToolKit/ToolKit.h>

@interface MainMenu : Menu

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *scene;
@property(nonatomic,strong)NSString *number;
@property(nonatomic,strong)NSNumber *level;
@property(nonatomic,strong)NSNumber *opentype;

@property(nonatomic,strong)NSArray *submenu;
@end

