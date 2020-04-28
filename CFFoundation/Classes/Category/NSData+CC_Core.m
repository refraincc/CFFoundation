//
//  NSData+CC_Core.m
//  CFFoundation
//
//  Created by cc on 2020/4/28.
//

#import "NSData+CC_Core.h"




@implementation NSData (CC_Core)






#pragma mark - JPEG (jpg)，文件头：FFD8***

- (BOOL)cc_isJPEG
{
    if (self.length > 4)
    {
        unsigned char buffer[4];
        [self getBytes:&buffer length:4];
        
        return buffer[0]==0xff &&
        buffer[1]==0xd8 &&
        buffer[2]==0xff &&
        buffer[3]==0xe0;
    }
    
    return NO;
}

#pragma mark - PNG (png)，文件头：8950***

- (BOOL)cc_isPNG
{
    if (self.length > 4)
    {
        unsigned char buffer[4];
        [self getBytes:&buffer length:4];
        
        return buffer[0]==0x89 &&
        buffer[1]==0x50 &&
        buffer[2]==0x4e &&
        buffer[3]==0x47;
    }
    
    return NO;
}

#pragma mark - GIF (gif)，文件头：474946***

- (BOOL)cc_isGIF
{
    if (self.length > 3)
    {
        unsigned char buffer[3];
        [self getBytes:&buffer length:3];
        
        return buffer[0]==0x47 &&
        buffer[1]==0x49 &&
        buffer[2]==0x46;
    }
    
    return NO;
}

#pragma mark - TIFF (tif)，文件头：49492A00

- (BOOL)cc_isTIFF
{
    if (self.length > 4)
    {
        unsigned char buffer[4];
        [self getBytes:&buffer length:4];
        
        return buffer[0]==0x49 &&
        buffer[1]==0x49 &&
        buffer[2]==0x2a &&
        buffer[3]==0x00;
    }
    
    return NO;
}

#pragma mark - BMP (bmp)，文件头：42 4D

- (BOOL)cc_isBMP
{
    if (self.length > 2)
    {
        unsigned char buffer[2];
        [self getBytes:&buffer length:2];
        
        return buffer[0]==0x42 &&
        buffer[1]==0x4d;
    }
    
    return NO;
}

#pragma mark - ICO (ico)，文件头：00 00 01 00 01***

- (BOOL)cc_isICO
{
    if (self.length > 5)
    {
        unsigned char buffer[5];
        [self getBytes:&buffer length:5];
        
        return buffer[2]==0x01 &&
        buffer[4]==0x01;
    }
    
    return NO;
}


#pragma mark - 返回图片的格式名称
/**
 *返回图片的格式名称
 */

- (NSString *)cc_imageType
{
    NSString *result = nil;
    
    if([self cc_isPNG])
    {
        result = @"image/png";
    }
    else if([self cc_isJPEG])
    {
        result = @"image/jpeg";
    }
    else if([self cc_isGIF])
    {
        result = @"image/gif";
    }
    else if([self cc_isTIFF])
    {
        result = @"image/tiff";
    }
    else if([self cc_isBMP])
    {
        result = @"image/bmp";
    }
    else if([self cc_isICO])
    {
        result = @"image/ico";
    }
    return result;
}





@end
