//
//  NavigationController.h
//  ObjcToolKit
//
//  Created by yihyeoncheol on 2020/08/29.
//  Copyright © 2020 yihyeoncheol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface NavigationController : UINavigationController



- (void)setViewController:(ViewController*)viewController message:(nullable Message*)message;
- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers
                  animated:(BOOL)animated
                completion:(void (^)(void))completion;
    
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                completion:(void (^)(void))completion;
- (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
                                                               completion:(void (^)(void))completion;

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
                                     completion:(void (^)(void))completion;

- (nullable NSArray<__kindof UIViewController *> *)popToRestorationIdentifier:(NSString *)identifier message:(nullable Message*)message;


- (void)dismissViewController:(ViewController*)viewController
                     animated:(BOOL)flag;
                   



- (void)pushWithStoryboard:(nonnull NSString*)storyboard vcName:(nonnull NSString*)vcName message:(nullable Message*)message;
- (void)presentWithStoryboard:(nonnull NSString*)storyboard vcName:(nonnull NSString*)vcName message:(nullable Message*)message;
- (void)openWithStoryboard:(nonnull NSString*)storyboard vcName:(nonnull NSString*)vcName message:(nullable Message*)message;
@end

NS_ASSUME_NONNULL_END
