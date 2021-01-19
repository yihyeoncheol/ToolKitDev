//
//  TabBar.h
//  ObjcToolKit
//
//  Created by MP02031 on 2020/09/07.
//  Copyright © 2020 yihyeoncheol. All rights reserved.
//

#import "Component.h"


typedef NS_ENUM(NSInteger, TabItemContentMode) {
    TabItemFill    = 0,    // default
    TabItemFit  = 1,    //
};



@class TabBarItem;
@class ScrollView;

NS_ASSUME_NONNULL_BEGIN
IB_DESIGNABLE
@interface TabBar : Component
@property(nonatomic,strong)ScrollView *contentView;
@property(nonatomic,strong)View *backgroundView;
@property(nonatomic,strong)NSArray<TabBarItem*> *items;
@property(nonatomic)IBInspectable NSInteger selectedIndex;
@property(nonatomic,strong,readonly)UIView *accessoryView;
@property(nonatomic)IBInspectable BOOL useAccessoryView;
@property(nonatomic)TabItemContentMode contentMode;
@property(nonatomic)IBInspectable CGFloat spacing;
@property(nonatomic)IBInspectable NSInteger itemMaximum; //default 5 ,only TabItemFill mode
@property(nonatomic)UIEdgeInsets contentInset;
@property(nonatomic)UIEdgeInsets contentEdgeInsets;
@property(nonatomic)UIEdgeInsets itemEdgeInsets; //only TabItemFill mode
@property(nonatomic,strong)NSMutableArray<Button*> *components;
- (UIView *)createAccessoryView;
- (Button*)indexforTabBarButton:(NSInteger)index;
@end

@interface TabBarItem : NSObject

@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) UIImage *selectedImage;
@property(nonatomic) UIEdgeInsets itmeEdgeInsets;
@property(nullable,nonatomic,strong) NSString *name;
@property(nullable,nonatomic,strong) id userInfo;
//@property(nullable,nonatomic,strong) NSString *style;

+ (TabBarItem*)itemWithTitle:(NSString*)title;

+ (TabBarItem*)itemWithImage:(UIImage*)image selectedImage:(UIImage*)selectedImage;
@end




NS_ASSUME_NONNULL_END
