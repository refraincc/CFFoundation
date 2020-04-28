//
//  NSString+CFCategory.m
//  CFFoundation
//
//  Created by refraincc on 2019/3/26.
//

#import "NSString+CFCategory.h"
#import <CommonCrypto/CommonDigest.h>  //md5

@implementation NSString (CFCategory)

@end

@implementation NSString (CFEncrypt)

- (NSString *)CF_MD5String {
    if (self == nil || [self length] == 0) return nil;
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)CF_URLEncoding {
    CFStringRef newStringRef =
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            NULL,
                                            CFSTR("!*'();:@&=+$,/?%#[]"),
                                            kCFStringEncodingUTF8);
    NSString *newString = [NSString stringWithString:(__bridge NSString *)newStringRef];
    CFRelease(newStringRef);
    return newString;
}

- (NSString *)CF_URLDecoding {
    if (self.length) {
        CFStringRef newStringRef =
        CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                (CFStringRef)self,
                                                                CFSTR(""),
                                                                kCFStringEncodingUTF8);
        NSString *newString = [NSString stringWithString:(__bridge NSString *)newStringRef];
        CFRelease(newStringRef);
        return newString;
    } else {
        return nil;
    }
}


@end



@implementation NSString (CFFilePath)


+ (NSString *)CF_doucumentPath {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

+ (NSString *)CF_libraryPath {
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
}

+ (NSString *)CF_cachesPath {
    return [[self CF_libraryPath] stringByAppendingPathComponent:@"Caches"];
}


@end
