//
//  NSDate+Category.m
//  LLBaseComponentLib
//
//  Created by LiLei on 30/7/2019.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

+ (NSDate *)timeStringToDate: (NSString *)timeString {
    /** /// "Sat Dec 03 19:56:38 +0800 2016",根据回调的时间字符串制定不一样的日期格式 */
    NSString * formatterString = @"EEE  MMM dd HH:mm:ss zzz yyyy";
    /** DateFormatter, Calendar初始化比较消耗内存, 定义成单例 */
    
    [[NSDateFormatter alloc]init].dateFormat = formatterString;
    /** 指定区域，真机一定要指定 */
    [[NSDateFormatter alloc]init].locale = [NSLocale localeWithLocaleIdentifier: @"en"];
    
    return [[[NSDateFormatter alloc]init] dateFromString: timeString];
}

- (NSString *)dateToRequiredString {
    if ([[NSCalendar currentCalendar] isDateInToday:self]) {
        //如果是今天
        int seconds = [[NSDate date] timeIntervalSinceDate:self];
        if (seconds < 60) {
            return @"刚刚";
        } else if (seconds < 60 * 60) {
            return [NSString stringWithFormat:@"%d分钟前", seconds / 60];
        } else {
            return [NSString stringWithFormat:@"%d小时前", seconds / 3600];
        }
    } else if ([[NSCalendar currentCalendar] isDateInYesterday:self]) {
        //如果是昨天 10: 10
        [[NSDateFormatter alloc]init].dateFormat = @"昨天 HH:mm";
        [[NSDateFormatter alloc]init].locale =  [NSLocale localeWithLocaleIdentifier: @"en"];
        return [[[NSDateFormatter alloc]init] stringFromDate:self];
    } else {
        //首先要取到今年是哪一年 2016
        //再取到当前的date是哪一年, 再做比较
        NSInteger thisYear = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate: [NSDate date]];
        NSInteger dateYear = [[NSCalendar currentCalendar] component:NSCalendarUnitYear fromDate: self];
        //是今年
        if (thisYear == dateYear) {
            [[NSDateFormatter alloc]init].dateFormat = @"MM-dd HH:mm";
            [[NSDateFormatter alloc]init].locale =  [NSLocale localeWithLocaleIdentifier: @"en"];
            return [[[NSDateFormatter alloc]init] stringFromDate:self];
        }
        //往年
        else {
            [[NSDateFormatter alloc]init].dateFormat = @"yyyy-MM-dd HH:mm";
            [[NSDateFormatter alloc]init].locale =  [NSLocale localeWithLocaleIdentifier: @"en"];
            return [[[NSDateFormatter alloc]init] stringFromDate:self];
        }
    }
}

@end
