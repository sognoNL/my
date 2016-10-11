//
//  YXBaseCell.h
//  BizYixin
//
//  Created by NL on 15-3-3.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXBaseCell : UITableViewCell

- (void)setCellData:(id)cellData;

+ (UITableViewCell *)setupCell:(UITableView *)tblView
                    withCellID:(NSString *)cellID;

@end
