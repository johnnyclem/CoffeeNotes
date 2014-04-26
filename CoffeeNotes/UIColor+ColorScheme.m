//
//  UIColor+ColorScheme.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/26/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "UIColor+ColorScheme.h"

@implementation UIColor (ColorScheme)

+ (UIColor *)lightBrownColor
{
    return [UIColor colorWithRed:0.400 green:0.239 blue:0.020 alpha:1];
}

+ (UIColor *)darkSalmonColor
{
    return [UIColor colorWithRed:0.729 green:0.388 blue:0.271 alpha:1];
}

+ (UIColor *)lightSalmonColor
{
    return [UIColor colorWithRed:0.882 green:0.498 blue:0.353 alpha:1];
}

+ (UIColor *)offGreyColor
{
    return [UIColor colorWithRed:0.835 green:0.804 blue:0.722 alpha:1];
}

+ (UIColor *)offWhiteColor;
{
    return [UIColor colorWithRed:0.965 green:0.965 blue:0.957 alpha:1];
}

@end
