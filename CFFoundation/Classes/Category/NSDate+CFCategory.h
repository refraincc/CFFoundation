//
//  NSDate+CFCategory.h
//  CFFoundation
//
//  Created by refraincc on 2019/3/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (CFCategory)


/*!
 年
 */
- (NSInteger)CF_getYear;

/*!
 月
 */
- (NSInteger)CF_getMonth;

/*!
 日
 */
- (NSInteger)CF_getDay;

/*!
 时
 */
- (NSInteger)CF_getHour;

/*!
 分
 */
- (NSInteger)CF_getMinute;

/*!
 秒
 */
- (NSInteger)CF_getSecond;

/*!
 过滤，只剩年月日信息
 */
- (NSDate *)CF_filterForYearMonthDay;

/*!
 过滤，只剩时分秒
 */
- (NSInteger)CF_filterForHourMinuteSecond;

/**
 *  将字符串时间根据fomatter处理成NSDate
 */
+ (NSDate *)CF_dateByDateString:(NSString *)dateString formatterString:(NSString *)formatterString;

/*!
 将一个NSDate根据format的格式处理成string
 */
- (NSString *)CF_dateStringWithFormat:(NSString *)format;

/*!
 将一个NSDate处理成“yyyy年MM月dd日”的格式
 */
- (NSString *)CF_normalDateString;

/*!
 将一个NSDate处理成星期格式
 */
- (NSString*)CF_weekdayString;

/*!
 将一个NSDate毫秒处理成距离现在的时间间隔
 */
+ (NSString *)CF_timeStringWithInterval:(NSTimeInterval)time;

@end

NS_ASSUME_NONNULL_END
