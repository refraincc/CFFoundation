//
//  NSData+CC_Core.h
//  CFFoundation
//
//  Created by cc on 2020/4/28.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (CC_Core)


/// JPEG (jpg)，文件头：FFD8***
- (BOOL)cc_isJPEG;

/// PNG (png)，文件头：8950***

- (BOOL)cc_isPNG;

/// GIF (gif)，文件头：474946***

- (BOOL)cc_isGIF;

/// TIFF (tif)，文件头：49492A00

- (BOOL)cc_isTIFF;
/// BMP (bmp)，文件头：42 4D

- (BOOL)cc_isBMP;

/// ICO (ico)，文件头：00 00 01 00 01***

- (BOOL)cc_isICO;

/// 返回图片的格式名称

- (NSString *)cc_imageType;

@end

NS_ASSUME_NONNULL_END
