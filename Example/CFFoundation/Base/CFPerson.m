//
//  CFPerson.m
//  CFKit_Example
//
//  Created by cc on 2020/4/28.
//  Copyright © 2020 Guhuotaren. All rights reserved.
//

#import "CFPerson.h"

@implementation CFPerson



- (void)encodeWithCoder:(NSCoder *)encoder{
    
    [encoder encodeObject:self.name forKey:@"name"];
    
}
- (nullable instancetype)initWithCoder:(NSCoder *)decoder{
    
    if (self = [super init]) {
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    
    return self;
    
} // NS_DESIGNATED_INITIALIZER


- (id)copyWithZone:(nullable NSZone *)zone{
    CFPerson *p = [CFPerson allocWithZone:zone];
    p.name = self.name;
    return p;
}


@end
