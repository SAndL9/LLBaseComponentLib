//
//  NSDate+Category.h
//  LLBaseComponentLib
//
//  Created by LiLei on 30/7/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Category)
/** 获取到的时间字符串转成NSDate */
+ (NSDate * )timeStringToDate: (NSString *)timeString;
/** 把NSDate转成自己需要的时间格式  刚刚 N分钟前 N小时前 昨天M */
- (NSString *)dateToRequiredString;
@end

NS_ASSUME_NONNULL_END
