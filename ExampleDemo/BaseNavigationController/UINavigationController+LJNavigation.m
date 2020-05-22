//
//  UINavigationController+LJNavigation.m
//  ExampleDemo
//
//  Created by 李罗坚 on 2020/5/22.
//  Copyright © 2020 李罗坚. All rights reserved.
//

#import "UINavigationController+LJNavigation.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import <objc/runtime.h>
@implementation UINavigationController (LJNavigation)

-(void)setNavBack:(void (^)(void))navBack{
    objc_setAssociatedObject(self, @selector(navBack), navBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if(navBack){
        UIPanGestureRecognizer *panGester = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(naviBackAction)];
        [self.viewControllers.lastObject.view addGestureRecognizer:panGester];
        panGester.delegate = self;
        self.fd_interactivePopDisabled = YES;
    }
}

-(void (^)(void))navBack{
    return objc_getAssociatedObject(self, @selector(navBack));
}


-(void)naviBackAction{
    if(self.navBack){
        self.navBack();
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    // 如果根控制器也要返回手势有效, 就会造成假死状态
    // 所以, 需要过滤根控制器
    if(self.childViewControllers.count == 1) {
        return NO;
    }
    
    // Prevent calling the handler when the gesture begins in an opposite direction.
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    
    return YES;
}
@end
