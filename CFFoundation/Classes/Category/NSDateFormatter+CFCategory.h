//
//  NSDateFormatter+CFCategory.h
//  CFFoundation
//
//  Created by refraincc on 2019/3/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDateFormatter (CFCategory)

+ (NSDateFormatter *)CF_formatterWithFormat:(NSString *)aFormat;

@end

NS_ASSUME_NONNULL_END
