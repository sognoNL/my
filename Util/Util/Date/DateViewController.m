//
//  DateViewController.m
//  UtilDemo
//
//  Created by NL on 15-3-27.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "DateViewController.h"
#import "DateUtil.h"
#import "DateCell.h"

@interface DateViewController ()
{
    NSArray *titleAry;
    NSDate *curtime;
    NSDate *lastdate;
    NSDateComponents *comps;
}
@end

@implementation DateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    titleAry = @[@"当前时间",@"date-str1",@"date-str2",@"str-date",@"昨今明",@"取week",
                 @"取month",@"去day",@"取hour",@"取min",@"取sec",@"相差",@"距今"];
    curtime = [DateUtil getCurrentDate];
    lastdate = [DateUtil NSStringToNSDate:@"2015-03-26 11:12:22"];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:lastdate];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *DateCellID = @"DateCellID";
    DateCell *cell = (DateCell *)[YXBaseCell setupCell:tableView withCellID:DateCellID];
    NSDictionary *dic = nil;
    switch (indexPath.row)
    {
        case 0:
            {
                dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[NSString stringWithFormat:@"%@",curtime]};
            }
            break;
        case 1:
            {
                dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[DateUtil getDateStringFromDate:curtime]};
            }
            break;
        case 2:
        {
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[DateUtil NSDateToNSString:curtime]};
        }
            break;
        case 3:
        {
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[NSString stringWithFormat:@"%@",lastdate]};
        }
            break;
        case 4:
        {
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[DateUtil compareDate:lastdate]};
        }
            break;
        case 5:
        {
            //Week:
            //1 －－星期天
            //2－－星期一
            //3－－星期二
            //4－－星期三
            //5－－星期四
            //6－－星期五
            //7－－星期六
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[NSString stringWithFormat:@"%ld",(long)[comps weekday]]};
        }
            break;
        case 6:
        {
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[NSString stringWithFormat:@"%ld",(long)[comps month]]};
        }
          break;
        case 7:
        {
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[NSString stringWithFormat:@"%ld",(long)[comps day]]};
        }
            break;
        case 8:
        {
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[NSString stringWithFormat:@"%ld",(long)[comps hour]]};
        }
            break;
        case 9:
        {
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[NSString stringWithFormat:@"%ld",(long)[comps minute]]};
        }
            break;
        case 10:
        {
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[NSString stringWithFormat:@"%ld",(long)[comps second]]};
        }
            break;
        case 11:
        {
            NSInteger day = [DateUtil getDateToDateDays:lastdate withSaveDate:curtime];
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[NSString stringWithFormat:@"%ld",day]};
        }
            break;
        case 12:
        {
            dic = @{kTilteLabel:titleAry[indexPath.row],kDetailLabel:[DateUtil intervalSinceNow:@"2011-03-27 11:12:22"]};
        }
            break;
        default:
            break;
    }
    [cell setCellData:dic];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
