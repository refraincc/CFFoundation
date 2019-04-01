//
//  CFWeakProxy.h
//  CFFoundation
//
//  Created by refraincc on 2019/3/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CFWeakProxy : NSProxy


/**
 利用NSProxy实现对target的弱引用
 
 @param target 需要被弱引用的target
 @return CFWeakProxy对象
 */
+ (instancetype)weakProxyForObject:(id)target;

@end

NS_ASSUME_NONNULL_END
