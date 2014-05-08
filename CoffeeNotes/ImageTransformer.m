//
//  ImageTransformer.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/8/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "ImageTransformer.h"

@implementation ImageTransformer

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

+ (Class)transformedValueClass
{
    return [NSData class];
}

- (id)transformedValue:(id)value
{
    NSData *data = UIImageJPEGRepresentation(value, .5);
    
    return data;
}

- (id)reverseTransformedValue:(id)value
{
    UIImage *image = [[UIImage alloc] initWithData:value];
    return image;
}

@end
