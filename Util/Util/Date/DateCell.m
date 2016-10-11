//
//  DateCell.m
//  UtilDemo
//
//  Created by NL on 15-3-27.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "DateCell.h"

@interface DateCell()
{
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *detailLabel;
}
@end

@implementation DateCell

- (void)setCellData:(id)cellData
{
    NSDictionary *dic = (NSDictionary *)cellData;
    titleLabel.text = dic[kTilteLabel];
    detailLabel.text = dic[kDetailLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
