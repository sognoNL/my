//
//  YXDefine.h
//  BizYixin
//
//  Created by NL on 15-3-4.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#ifndef BizYixin_YXDefine_h
#define BizYixin_YXDefine_h

//  主要单例
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define NotificationCenter                 [NSNotificationCenter defaultCenter]
#define SharedApplication                 [UIApplication sharedApplication]
#define Bundle                              [NSBundle mainBundle]
#define MainScreen                          [UIScreen mainScreen]

//  主要控件
#define NavBar                              self.navigationController.navigationBar
#define TabBar                              self.tabBarController.tabBar

#define kUINavBarBgPng                      @"navBg.png"
#define kNavBarLeft                 @"kNavBarLeft"
#define kNavBarRight                @"kNavBarRight"
//屏幕尺寸
#define kDevice_W    ([UIScreen mainScreen].bounds.size.width)
#define kDevice_H     ([UIScreen mainScreen].bounds.size.height)

#define RectX(rect)                            rect.origin.x
#define RectY(rect)                            rect.origin.y
#define RectWidth(rect)                        rect.size.width
#define RectHeight(rect)                       rect.size.height

//系统版本
#define IOS_VERSION      [[[UIDevice currentDevice] systemVersion] floatValue]
#define IsIOS6      ([[[UIDevice currentDevice] systemVersion] floatValue] >=6.0 ? YES : NO)
#define IsIOS7      ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)
#define IsIOS8      ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)

//所有页面的背景色
#define kAllViewControllerBgColor   [UIColor whiteColor]

//简化国际化方法  太懒了，╮(╯▽╰)╭
#define YXString(x)  NSLocalizedString(x, @"")

//判断字符串空
#define isStringEmptyOrNil(x) ((x == nil || [x length] == 0) ? YES : NO)

//获取#FFFFFF格式颜色  给定 #FFFFFF格式  传参格式为 UIColorWithHex(0x6af0a4)  替换 '#' -> '0x'
#define UIColorWithHex(c)       [UIColor colorWithRed:((c>>16)&0xFF)/255.0f green:((c>>8)&0xFF)/255.0f blue:(c&0xFF)/255.0f alpha:1.0f]
//下面2个方法生成随机颜色
#define kColorAry  @[ UIColorWithHex(0xfea854),UIColorWithHex(0x5a9cea)]  //橙色,蓝色
//#define index     arc4random() % 2 //获取一个随机整数范围在：[0,2)包括0，不包括2,既在0 & 1之间随机
#define kRandomColor  kColorAry[arc4random() % 2]

//关于页面展示的版本号
#define kAppName  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]
#define kVersion  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kBuild  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define kAboutShowVersion  [NSString stringWithFormat:@"%@ V%@.%@",YXString(kAppName),kVersion,kBuild]

#endif
