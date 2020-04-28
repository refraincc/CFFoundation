//
//  NSArray+CFCategory.h
//  CFFoundation
//
//  Created by cc on 2020/4/28.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (CFCategory)


/// 删除数组中重复元素 ps: id<NSCoping>
- (NSArray *)cc_removeRepetitionObjects;


@end

NS_ASSUME_NONNULL_END
