//
//  TitleCell.m
//  UtilDemo
//
//  Created by NL on 15-3-27.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "TitleCell.h"
@interface TitleCell()
{
    IBOutlet UILabel *titleLabel;
}

@end

@implementation TitleCell

- (void)setCellData:(id)cellData
{
    titleLabel.text = (NSString *)cellData;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
