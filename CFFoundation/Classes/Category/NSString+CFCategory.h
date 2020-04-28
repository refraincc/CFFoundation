//
//  NSString+CFCategory.h
//  CFFoundation
//
//  Created by refraincc on 2019/3/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CFCategory)

@end


@interface NSString (CFEncrypt)

- (NSString *)CF_MD5String;

- (NSString *)CF_URLEncoding;

- (NSString *)CF_URLDecoding;

@end


@interface NSString (CFFilePath)


+ (NSString *)CF_doucumentPath;

+ (NSString *)CF_libraryPath;

+ (NSString *)CF_cachesPath;


@end



NS_ASSUME_NONNULL_END
