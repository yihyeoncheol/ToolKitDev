//
//  NavigationController.m
//  ObjcToolKit
//
//  Created by yihyeoncheol on 2020/08/29.
//  Copyright © 2020 yihyeoncheol. All rights reserved.
//

#import "NavigationController.h"
#import "ViewController.h"
#import "StoryboardSegue.h"
//typedef void (^ __nullable completion)(void);

@interface NavigationController () <UINavigationControllerDelegate>
@property (nonatomic,copy)void (^completion)(void);
@end

@implementation NavigationController

- (void)dealloc {
    self.completion = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        UIViewController *controller = self.viewControllers.firstObject;
        [controller motionEnded:motion withEvent:event];
    }
}

- (void)showViewController:(UIViewController *)vc sender:(nullable id)sender {
    [super showViewController:vc sender:sender];
}

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                completion:(void (^)(void))completion {

    self.completion = completion;
    
    [super pushViewController:viewController animated:animated];
}


- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController completion:(void (^)(void))completion {
    self.completion = completion;
       
    ViewController *vc = (ViewController*)viewController;
    
    CAAnimation *animation = vc.appearAnimation;
    
    BOOL ani = YES;
    if(animation){
        [self.view.layer addAnimation:animation forKey:nil];
        ani = NO;
    }
    return [super popToViewController:viewController animated:ani];
}



- (nullable NSArray<__kindof UIViewController *> *)popToRestorationIdentifier:(NSString *)identifier message:(nullable Message*)message {
        
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"restorationIdentifier == %@", identifier];
    NSArray *child = [self.viewControllers filteredArrayUsingPredicate:predicate];
    ViewController *vc = (ViewController*)child.firstObject;
    
    NSArray *vcs = [self popToViewController:vc completion:^{
        [vc update:message];
    }];
    
    if (vcs.count > 0) {
        for (ViewController *vc in vcs) {
            [vc exit];
            for (ViewController *child in vc.childViewControllers) {
                [child exit];
            }
        }
    }
        
    return vcs;
}


- (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion {
    self.completion = completion;
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    NSArray *vcs = [super popToRootViewControllerAnimated:YES];
    
    if (vcs.count > 0) {
        for (ViewController *vc in vcs) {
            [vc exit];
            for (ViewController *child in vc.childViewControllers) {
                [child exit];
            }
        }
    }
    return vcs;
}
    
- (void)openWithStoryboard:(NSString*)storyboard vcName:(NSString*)vcName message:(Message*)message {
    
    NSArray *vcs = [super popToRootViewControllerAnimated:YES];
    
    if (vcs.count > 0) {
        for (ViewController *vc in vcs) {
            [vc exit];
            for (ViewController *child in vc.childViewControllers) {
                [child exit];
            }
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(500 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
            [self pushWithStoryboard:storyboard vcName:vcName message:message];
        });
    }else{
        [self pushWithStoryboard:storyboard vcName:vcName message:message];
    }
}


- (void)pushWithStoryboard:(NSString*)storyboard vcName:(NSString*)vcName message:(Message*)message {
 
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboard bundle:nil];
    ViewController *vc = [sb instantiateViewControllerWithIdentifier:vcName];
    
    CAAnimation *animation = vc.appearAnimation;
    
    BOOL ani = YES;
    if(animation){
        [self.view.layer addAnimation:animation forKey:nil];
        ani = NO;
    }
    [self pushViewController:vc animated:ani completion:^{
        [vc enter:message];
    }];
}

- (void)presentWithStoryboard:(NSString*)storyboard vcName:(NSString*)vcName message:(Message*)message {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboard bundle:nil];
    ViewController *vc = [sb instantiateViewControllerWithIdentifier:vcName];
    
    vc.providesPresentationContextTransitionStyle = YES;
    vc.definesPresentationContext = YES;
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    ViewController *topViewController = (ViewController *)self.topViewController;
    [topViewController pause];
    [self presentViewController:vc animated:NO completion:^{
        [vc enter:message];
    }];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
   UIViewController *vc = [self popViewControllerAnimated:animated completion:^{
        ViewController *vc = (ViewController *)self.topViewController;
        if ([vc isKindOfClass:[ViewController class]]) {
            [vc update:nil];
        }
    }];
    
    return vc;
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
                                     completion:(void (^)(void))completion {
    
    self.completion = completion;
    
    return [super popViewControllerAnimated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self pushViewController:viewController animated:NO completion:^{
        ViewController *vc = (ViewController *)self.topViewController;
        if ([vc isKindOfClass:[ViewController class]]) {
            [vc enter:nil];
        }
    }];
}

- (void)setViewController:(ViewController*)viewController message:(Message*)message {
    CAAnimation *animation = viewController.appearAnimation;
    
    if(animation){
        [self.view.layer addAnimation:animation forKey:nil];
    }
    [self setViewControllers:@[viewController] animated:NO completion:^{
        [viewController enter:message];
    }];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers
                  animated:(BOOL)animated
                completion:(void (^)(void))completion {
    self.completion = completion;
    [self setViewControllers:viewControllers animated:animated];
}
   
- (void)dismissViewController:(ViewController*)viewController animated:(BOOL)flag {
    [viewController exit];
    [viewController dismissViewControllerAnimated:flag completion:^{
        ViewController *vc = (ViewController *)self.topViewController;
        if ([vc isKindOfClass:[ViewController class]]) {
            [vc update:nil];
        }
    }];
}



#pragma mark -UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (_completion) {
        _completion();
    }
    self.completion = nil;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}


- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    
    return  nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    return  nil;
    
}


@end
