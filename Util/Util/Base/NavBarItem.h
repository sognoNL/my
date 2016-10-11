//
//  NavBarItem.h
//  BizYixin
//
//  Created by NL on 15-3-17.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIButton+bgImage.h"

@interface NavBarItem :NSObject
//返回按钮
+ (UIBarButtonItem *)navBackBtnWithTarget:(id)target
                                   action:(SEL)action;
//其他操作按钮
+ (UIBarButtonItem *)navBtnWithImg:(NSString *)imgName
                                         withTarget:(id)target
                                               action:(SEL)action
                                            direction:(NSString *)direction;
@end
