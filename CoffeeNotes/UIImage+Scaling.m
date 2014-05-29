//
//  UIImage+Scaling.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/29/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "UIImage+Scaling.h"

@implementation UIImage (Scaling)

//-(UIImage*)resizeImageToMaxSize:(CGFloat)max
//{
//    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:path], NULL);
//    if (!imageSource)
//        return nil;
//    
//    CFDictionaryRef options = (CFDictionaryRef)[NSDictionary dictionaryWithObjectsAndKeys:
//                                                (id)kCFBooleanTrue, (id)kCGImageSourceCreateThumbnailWithTransform,
//                                                (id)kCFBooleanTrue, (id)kCGImageSourceCreateThumbnailFromImageIfAbsent,
//                                                (id)[NSNumber numberWithFloat:max], (id)kCGImageSourceThumbnailMaxPixelSize,
//                                                nil];
//    CGImageRef imgRef = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options);
//    
//    UIImage* scaled = [UIImage imageWithCGImage:imgRef];
//    
//    CGImageRelease(imgRef);
//    CFRelease(imageSource);
//    
//    return scaled;
//}

@end
