//
//  NavBarItem.m
//  BizYixin
//
//  Created by NL on 15-3-17.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "NavBarItem.h"
#import "YXDefine.h"

@implementation NavBarItem

//返回按钮
+ (UIBarButtonItem *)navBackBtnWithTarget:(id)target
                                   action:(SEL)action
{
    return [self navBtnWithTitle:nil imageName:@"navback.png" target:target action:action direction:kNavBarLeft];
}

//其他操作按钮
+ (UIBarButtonItem *)navBtnWithImg:(NSString *)imgName
                            withTarget:(id)target
                                action:(SEL)action
                            direction:(NSString *)direction
{
    return [self navBtnWithTitle:nil imageName:imgName target:target action:action direction:(NSString *)direction];
}

+ (UIBarButtonItem *)navBtnWithTitle:(NSString *)title
                               imageName:(NSString *)imageName
                                  target:(id)target
                                  action:(SEL)action direction:(NSString *)direction
{
    // 按钮宽度
    CGFloat bw = 0.0f;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    UIImage *image = [UIImage imageNamed:imageName];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title)
    {
        bw = [title sizeWithFont:font].width + 28;
        
        UIImage *bgImage = [image stretchableImageWithLeftCapWidth:15 topCapHeight:8];
        [button setBackgroundImage:bgImage forState:UIControlStateNormal];
        
        [button.titleLabel setFont:font];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateHighlighted];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];
    }
    else if (image)
    {
        bw = 40;
        [self _btn:button setImage:image imgName:imageName];
    }
    else
    {
    }
    
    [button setFrame:CGRectMake(0, 0, bw, 32)];
    CGFloat offleft = 0;
    CGFloat offright = 0;
    if ([direction isEqualToString:kNavBarLeft])
    {
        if (IsIOS7)
        {
            offleft = -32;
        }
    }
   else
   {
       if (IsIOS7)
       {
           offright = -5;
       }
   }
    [button setContentEdgeInsets:UIEdgeInsetsMake(0, offleft, 0, offright)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return backButtonItem;
}

+ (void)_btn:(UIButton *)button setImage:(UIImage *)image imgName:(NSString *)imageName
{
    NSString *sub = [imageName substringWithRange:NSMakeRange(0, imageName.length - 4)];
    NSString *hightImageName = [NSString stringWithFormat:@"%@_pressed.png",sub];
    UIImage *hightImage = [UIImage imageNamed:hightImageName];
    button.showsTouchWhenHighlighted = YES;
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:hightImage forState:UIControlStateHighlighted];
}

@end
