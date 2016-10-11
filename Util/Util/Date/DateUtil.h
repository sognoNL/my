//
//  DateUtil.h
//  UtilDemo
//
//  Created by NL on 15-3-27.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

//获取当前日期，时间
+(NSDate *)getCurrentDate;

//将日期转换为字符串（日期，时间）
+(NSString *)getDateStringFromDate:(NSDate *)date;

//计算两个日期之间的差距，过了多少天。。
+(NSInteger)getDateToDateDays:(NSDate *)date withSaveDate:(NSDate *)saveDate;

//判断日期是今天，昨天还是明天
+ (NSString *)compareDate:(NSDate *)date;

//日期转字符串
+ (NSString * )NSDateToNSString: (NSDate * )date;

//字符串转日期
+ (NSDate * )NSStringToNSDate: (NSString * )string;

//计算某一天距离今天多少天，多少小时，多少分钟
+ (NSString *)intervalSinceNow: (NSString *) theDate;

//判断2个时间是否是同一周
+ (BOOL)isSameDateWithDate:(NSDate *)date1 andData:(NSDate *)date2;
@end
