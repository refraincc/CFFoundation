//
//  NSDate+CFCategory.m
//  CFFoundation
//
//  Created by refraincc on 2019/3/26.
//

#import "NSDate+CFCategory.h"
#import "NSDateFormatter+CFCategory.h"

@implementation NSDate (CFCategory)


- (NSInteger)CF_getYear {
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self];
    return [comp year];
}

- (NSInteger)CF_getMonth {
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self];
    return [comp month];
}

- (NSInteger)CF_getDay {
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self];
    return [comp day];
}

- (NSInteger)CF_getHour {
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self];
    return [comp hour];
}

- (NSInteger)CF_getMinute {
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self];
    return [comp minute];
}

- (NSInteger)CF_getSecond {
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self];
    return [comp second];
}

- (NSDate *)CF_filterForYearMonthDay {
    NSDateFormatter *formatter = [NSDateFormatter CF_formatterWithFormat:@"yyyyMMdd"];
    NSString *dateString = [formatter stringFromDate:self];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

- (NSInteger)CF_filterForHourMinuteSecond {
    NSInteger hour = [self CF_getHour];
    NSInteger minute = [self CF_getMinute];
    NSInteger second = [self CF_getSecond];
    return hour * 3600 + minute * 60 + second;
}

+ (NSDate *)CF_dateByDateString:(NSString *)dateString formatterString:(NSString *)formatterString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:formatterString];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

- (NSString *)CF_dateStringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateString = [formatter stringFromDate:self];
    return dateString;
}

- (NSString *)CF_normalDateString {
    return [self CF_dateStringWithFormat:@"yyyy年MM月dd日"];
}

- (NSString*)CF_weekdayString{
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六",  nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:self];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}


+ (NSString *)CF_timeStringWithInterval:(NSTimeInterval)time{
    int distance = [[NSDate date] timeIntervalSince1970] - time;
    NSString *string;
    if (distance < 1){
        string = @"现在";
    }
    else if (distance < 60) {
        string = [NSString stringWithFormat:@"%d秒前", (distance)];
    }
    else if (distance < 3600) {//60 * 60
        distance = distance / 60;
        string = [NSString stringWithFormat:@"%d分钟前", (distance)];
        
    }
    else if (distance < 86400) {//60 * 60 * 24
        distance = distance / 3600;
        string = [NSString stringWithFormat:@"%d小时前", (distance)];
    }
    else if (distance < 604800) {//60 * 60 * 24 * 7
        distance = distance / 86400;
        string = [NSString stringWithFormat:@"%d天前", (distance)];
        
    }
    else if (distance < 2419200) {//60 * 60 * 24 * 7 * 4
        distance = distance / 604800;
        string = [NSString stringWithFormat:@"%d星期前", (distance)];
    }
    else {
        NSDateFormatter *dateFormatter = nil;
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        }
        string = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:(time)]];
        
    }
    return string;
}


@end
