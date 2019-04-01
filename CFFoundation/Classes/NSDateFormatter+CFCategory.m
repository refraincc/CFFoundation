//
//  NSDateFormatter+CFCategory.m
//  CFFoundation
//
//  Created by refraincc on 2019/3/26.
//

#import "NSDateFormatter+CFCategory.h"

@implementation NSDateFormatter (CFCategory)


+ (NSDateFormatter *)CF_formatterWithFormat:(NSString *)aFormat{
    static NSMutableDictionary *dictionary;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dictionary = [[NSMutableDictionary alloc] init];
    });
    NSDateFormatter *dateFormat = [dictionary objectForKey:aFormat];
    if (!dateFormat) {
        dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:aFormat];
        [dateFormat setTimeZone:[NSTimeZone localTimeZone]];
        [dateFormat setLocale:[NSLocale systemLocale]];
        [dictionary setObject:dateFormat forKey:aFormat];
    }
    return dateFormat;
}

@end
