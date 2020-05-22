//
//  HHBaseNavigationController.m
//  WealthPartners
//
//  Created by 李罗坚 on 2020/3/11.
//  Copyright © 2020 李罗坚. All rights reserved.
//

#import "LJBaseNavigationController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import "UINavigationController+LJNavigation.h"
@interface LJBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LJBaseNavigationController

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if(self = [super initWithRootViewController:rootViewController]){

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
    //隐藏bar下面默认的黑线
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

/**
 重写push方法设置统一的导航样式
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.childViewControllers.count>0){
        //离开主页tab时隐藏底部的tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        //设置返回按钮
        UIImage *selectedImage=[UIImage imageNamed:@"back.png"];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.fd_interactivePopDisabled = NO;//开启侧滑返回
        viewController.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithImage:selectedImage style:UIBarButtonItemStylePlain target:self action:@selector(naviBack)];
    }
    
    [super pushViewController:viewController animated:YES];
}

/**
 统一处理返回事件
 */
-(void)naviBack{
    if(self.navBack){
        self.navBack();
    }else{
        [self popViewControllerAnimated:YES];
    }
}

@end
