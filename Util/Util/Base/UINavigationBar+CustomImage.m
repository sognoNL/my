//
//  UINavigationBar+CustomImage.m
//  ECP4iPhone
//
//  Created by jtang on 12-6-1.
//  Copyright (c) 2012年 jtang.com.cn. All rights reserved.
//

#import "UINavigationBar+CustomImage.h"
#import "YXDefine.h"

@implementation UINavigationBar (CustomImage)

- (void)drawRect:(CGRect)rect
{
    UIImage *image = [[UIImage imageNamed:kUINavBarBgPng] stretchableImageWithLeftCapWidth:6
                                                                              topCapHeight:23];

    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

- (void)setDefaultNavBarBg
{
//    if (gAppPrefsMgr.isAboveiOSFive)
//    {
        [self setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor]}];
    
        UIImage *bgImage = [[UIImage imageNamed:kUINavBarBgPng] stretchableImageWithLeftCapWidth:5
                                                                                  topCapHeight:15];
        [self setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
//    }
//    else
//    {
//        [self setNeedsDisplay];
//    }
}

@end
