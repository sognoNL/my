//
//  UIButton+bgImage.m
//  BizYixin
//
//  Created by NL on 15-3-17.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "UIButton+bgImage.h"

@implementation UIButton (bgImage)
- (void)setNormalBtnBgImg
{
    UIImage *normalImg = [UIImage imageNamed:@"btnBg_normal.png"];
    UIImage *pressImg = [UIImage imageNamed:@"btnBg_pressed.png"];
    UIImage *disableImg = [UIImage imageNamed:@"btnBg_disable.png"];
    
    UIImage *normalImgStrech = [normalImg stretchableImageWithLeftCapWidth:normalImg.size.width/2.0 topCapHeight:0];
    UIImage *pressImgStrech = [pressImg stretchableImageWithLeftCapWidth:normalImg.size.width/2.0 topCapHeight:0];
    UIImage *disableImgStrech = [disableImg stretchableImageWithLeftCapWidth:normalImg.size.width/2.0 topCapHeight:0];
    
    [self setBackgroundImage:normalImgStrech forState:UIControlStateNormal];
    [self setBackgroundImage:pressImgStrech forState:UIControlStateHighlighted];
    [self setBackgroundImage:disableImgStrech forState:UIControlStateDisabled];
}
@end
