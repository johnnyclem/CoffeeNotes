//
//  CoffeeWheelPointView.m
//  Coffee Wheel
//
//  Created by John Clem on 4/29/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "CoffeeWheelPointView.h"

@implementation CoffeeWheelPointView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
 //// Color Declarations
 UIColor* emptyPointColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
 UIColor* borderColor = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];
 
 //// Point1 Drawing
 UIBezierPath* point1Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 15, 15)];
 [emptyPointColor setFill];
 [point1Path fill];
 [borderColor setStroke];
 point1Path.lineWidth = 2;
 [point1Path stroke];
}

@end
