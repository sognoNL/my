//
//  UINavigationBar+CustomImage.h
//  ECP4iPhone
//
//  Created by jtang on 12-6-1.
//  Copyright (c) 2012年 jtang.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (CustomImage)

//- (void)willMoveToWindow:(UIWindow *)newWindow;
- (void)drawRect:(CGRect)rect;
/// 设置导航栏背景
- (void)setDefaultNavBarBg;
@end
