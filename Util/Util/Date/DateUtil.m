//
//  DateUtil.m
//  UtilDemo
//
//  Created by NL on 15-3-27.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "DateUtil.h"
#define kDEFAULT_DATE_TIME_FORMAT (@"yyyy-MM-dd HH:mm:ss")
@implementation DateUtil

//获取当前日期，时间
+(NSDate *)getCurrentDate{
//    long time = 1436630400000/1000;
//    NSDate *now = [[NSDate alloc] initWithTimeIntervalSince1970:time];
    NSDate *now = [NSDate date];
    return now;
}

//将日期转换为字符串（日期，时间）
+(NSString *)getDateStringFromDate:(NSDate *)date{
    NSInteger location = 0;
    NSString *timeStr = @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [formatter setDateFormat:@"HH:mm:ss:a"];
    NSString *ampm = [[[formatter stringFromDate:date] componentsSeparatedByString:@":"] objectAtIndex:3];
    timeStr = [formatter stringFromDate:date];
    NSRange range = [timeStr rangeOfString:[NSString stringWithFormat:@":%@",ampm]];
    location = range.location;
    NSString *string = [timeStr substringToIndex:location];
    timeStr = [NSString stringWithFormat:@"%@ %@",ampm,string];
    
    
    NSString *dateStr = @"";
    NSDateFormatter *Dformatter = [[NSDateFormatter alloc] init];
    [Dformatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [Dformatter setDateFormat:@"yyyy-MM-dd"];
    dateStr = [Dformatter stringFromDate:date];
    //    NSLog(@"%@", [NSString stringWithFormat:@"%@  %@",dateStr,timeStr]);
    return [NSString stringWithFormat:@"%@  %@",dateStr,timeStr];
}


//计算两个日期之间的差距，过了多少天。。
+(NSInteger)getDateToDateDays:(NSDate *)date withSaveDate:(NSDate *)saveDate{
    NSCalendar* chineseClendar = [ [ NSCalendar alloc ] initWithCalendarIdentifier:NSGregorianCalendar ];
    NSUInteger unitFlags =  NSHourCalendarUnit | NSMinuteCalendarUnit |
    NSSecondCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *cps = [ chineseClendar components:unitFlags fromDate:date  toDate:saveDate  options:0];
    NSInteger diffDay   = [ cps day ];
    return diffDay;
}

//例：NSDate *lastDate = [self getSaveDate];//saveDate通过将NSDate转换为NSString来保存
//currentDate = [NSDate date];
//NSInteger day = [DateHelper getDateToDateDays:currentDate withSaveDate: lastDate];

//日期转字符串
+ (NSString * )NSDateToNSString: (NSDate * )date
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: kDEFAULT_DATE_TIME_FORMAT];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}


//字符串转日期
+ (NSDate * )NSStringToNSDate: (NSString * )string
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: kDEFAULT_DATE_TIME_FORMAT];
    NSDate *date = [formatter dateFromString :string];
    return date;
}

//判断日期是今天，昨天还是明天
+ (NSString *)compareDate:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString])
    {
        return @"今天";
    }
    else if ([dateString isEqualToString:yesterdayString])
    {
        return @"昨天";
    }
    else if ([dateString isEqualToString:tomorrowString])
    {
        return @"明天";
    }
    else
    {
        return dateString;
    }
}

//计算时间，month,week and day,hour , minutes and second
//initializtion parameter

//NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//NSDate *now;
//NSDateComponents *comps = [[NSDateComponents alloc] init];
//NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
//NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
//now=[NSDate date];
//comps = [calendar components:unitFlags fromDate:now];
//week = [comps weekday];
//month = [comps month];
//day = [comps day];
//hour = [comps hour];
//min = [comps minute];
//sec = [comps second];

//Week:
//1 －－星期天
//2－－星期一
//3－－星期二
//4－－星期三
//5－－星期四
//6－－星期五
//7－－星期六

//计算某一天距离今天多少天，多少小时，多少分钟
+ (NSString *)intervalSinceNow: (NSString *) theDate
{
    NSString *timeString=@"";
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *fromdate=[format dateFromString:theDate];
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    
    //获取当前时间
    NSDate *adate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: adate];
    NSDate *localeDate = [adate  dateByAddingTimeInterval: interval];
    
    double intervalTime = [fromDate timeIntervalSinceReferenceDate] - [localeDate timeIntervalSinceReferenceDate];
    long lTime = fabs((long)intervalTime);
    NSInteger iSeconds =  lTime % 60;
    NSInteger iMinutes = (lTime / 60) % 60;
    NSInteger iHours = fabs(lTime/3600);
    NSInteger iDays = lTime/60/60/24;
    NSInteger iMonth =lTime/60/60/24/12;
    NSInteger iYears = lTime/60/60/24/384;
    
    
    NSLog(@"相差%ld年%ld月 或者 %ld日%ld时%ld分%ld秒", iYears,iMonth,iDays,iHours,iMinutes,iSeconds);
    
    
    if (iHours<1 && iMinutes>0)
    {
        timeString=[NSString stringWithFormat:@"%ld分",iMinutes];
    }
    else if (iHours>0&&iDays<1 && iMinutes>0)
    {
        timeString=[NSString stringWithFormat:@"%ld时%ld分",iHours,iMinutes];
    }
    else if (iHours>0&&iDays<1)
    {
        timeString=[NSString stringWithFormat:@"%ld时",iHours];
    }
    else if (iDays>0 && iHours>0 && iYears<1)
    {
        timeString=[NSString stringWithFormat:@"%ld天%ld时",iDays,iHours];
    }
    else if (iDays>0 && iYears<1)
    {
        timeString=[NSString stringWithFormat:@"%ld天",iDays];
    }
    else if (iDays>0 &&iYears>1)
    {
        timeString=[NSString stringWithFormat:@"%ld年%ld天",iYears,iDays];
    }
    return timeString;
}

//判断2个时间是否是同一周
+ (BOOL)isSameDateWithDate:(NSDate *)date1 andData:(NSDate *)date2{
    //日期间隔大于七天之间返回NO
    if (fabs([date1 timeIntervalSinceDate:date2]) >= 7 * 24 *3600)
    {
        return NO;
    }
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    calender.firstWeekday = 2;//设置每周第一天从周一开始
    //计算两个日期分别为这年第几周
    NSUInteger countSelf = [calender ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:date1];
    NSUInteger countDate = [calender ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:date2];
    
    //相等就在同一周，不相等就不在同一周
    return countSelf == countDate;
}

//1970年到现在的秒数转换成时间显示

- (NSString *)bySecondGetDate:(NSString *)second{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSString *dateLoca = [NSString stringWithFormat:@"%@",second];
    NSTimeInterval time=[dateLoca doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSString *timestr = [formatter stringFromDate:detaildate];
    return timestr;
}
@end
