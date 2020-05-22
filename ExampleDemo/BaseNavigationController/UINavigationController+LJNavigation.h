//
//  UINavigationController+LJNavigation.h
//  ExampleDemo
//
//  Created by 李罗坚 on 2020/5/22.
//  Copyright © 2020 李罗坚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UINavigationController (LJNavigation)<UIGestureRecognizerDelegate>
@property (nonatomic , copy)void(^ __nullable navBack)(void);
@end

NS_ASSUME_NONNULL_END
