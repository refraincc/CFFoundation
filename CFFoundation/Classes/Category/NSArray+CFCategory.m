//
//  NSArray+CFCategory.m
//  CFFoundation
//
//  Created by cc on 2020/4/28.
//

#import "NSArray+CFCategory.h"


@implementation NSArray (CFCategory)


- (NSArray *)cc_removeRepetitionObjects{
    return [self valueForKeyPath:@"@distinctUnionOfObjects.self"];
}

- (NSArray *)cc_removeRepetitionObjectsWithKey:(NSString *)key{
    
    NSString *keyPath = [NSString stringWithFormat:@"@distinctUnionOfObjects.%@",key];
    
    return [self valueForKeyPath:keyPath];
    
}


@end
