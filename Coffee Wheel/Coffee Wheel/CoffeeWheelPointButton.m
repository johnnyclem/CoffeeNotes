//
//  CoffeeWheelPointButton.m
//  Coffee Wheel
//
//  Created by John Clem on 4/29/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "CoffeeWheelPointButton.h"


#define kFilledPointColor = [UIColor colorWithRed: 0.2 green: 0.2 blue: 0.2 alpha: 1];

@interface CoffeeWheelPointButton ()

@property (nonatomic, strong) UIColor *emptyPointColor, *filledPointColor;
@end

@implementation CoffeeWheelPointButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setSelected:!self.isSelected];
}

- (void)drawRect:(CGRect)rect
{
    _emptyPointColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    _filledPointColor = [UIColor colorWithRed: .2 green: .2 blue: .2 alpha: 1];

    //// Color Declarations
    UIColor* borderColor = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];

    //// Point1 Drawing
    UIBezierPath* point1Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(1, 1, 14, 14)];

    if (self.selected) {
        [_filledPointColor setFill];
    } else {
        [_emptyPointColor setFill];
    }
    [point1Path fill];
    [borderColor setStroke];
    point1Path.lineWidth = 2;
    [point1Path stroke];
}

@end
