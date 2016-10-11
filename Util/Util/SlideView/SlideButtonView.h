//
//  SlideButtonView.h
//  UtilDemo
//
//  Created by 吴孟钦 on 15/7/27.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideButtonViewDelegate

@optional
- (void)selectBtnWithTag:(NSInteger)tag;

@end

@interface SlideButtonView : UIView
@property(nonatomic,strong) UIButton *titleButton;
@property (nonatomic,weak) id <SlideButtonViewDelegate>delegate;

- (id)initSlideButtonViewWithFrame:(CGRect)frame title:(NSString *)title tag:(int)tag;

- (void)selectBtn:(BOOL)enable;

@end
