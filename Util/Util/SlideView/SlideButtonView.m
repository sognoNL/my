//
//  SlideButtonView.m
//  UtilDemo
//
//  Created by 吴孟钦 on 15/7/27.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "SlideButtonView.h"

@implementation SlideButtonView
{
    UILabel *label;
}

- (id)initSlideButtonViewWithFrame:(CGRect)frame title:(NSString *)title tag:(int)tag
{
    self = [super initWithFrame:frame];
    if (self) {
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    frame.size.width = titleSize.width+20;
    self.frame = frame;
        
    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.tag = tag;
    _titleButton.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    [_titleButton setTitle:title forState:UIControlStateNormal];
    _titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_titleButton addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_titleButton];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-2, frame.size.width, 2)];
    label.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:label];
}
    return self;
}

- (void)selectBtn:(BOOL)enable
{
    label.backgroundColor = enable ? [UIColor greenColor]:[UIColor lightGrayColor];
}

- (void)btnPress:(id)sender
{
    [self selectBtn:YES];
    if (self.delegate)
    {
        [self.delegate selectBtnWithTag:_titleButton.tag];
    }
}

@end
