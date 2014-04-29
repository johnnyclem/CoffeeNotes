//
//  CoffeeWheelView.m
//  Coffee Wheel
//
//  Created by John Clem on 4/29/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "CoffeeWheelView.h"
#import "CoffeeWheelPointView.h"

@implementation CoffeeWheelView

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
    UIColor* color = [UIColor colorWithRed: 0.833 green: 0.833 blue: 0.833 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];
    UIColor* emptyPointColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 320, 320);
    
    //// Subframes
    CGRect rings = CGRectMake(CGRectGetMinX(frame) + 10, CGRectGetMinY(frame) + 10, floor((CGRectGetWidth(frame) - 10) * 0.95806 + 0.5), floor((CGRectGetHeight(frame) - 10) * 0.95806 + 0.5));
    CGRect nWArm2 = CGRectMake(CGRectGetMinX(frame) + 3, CGRectGetMinY(frame) + 152, floor((CGRectGetWidth(frame) - 3) * 0.49527 + 0.5), floor((CGRectGetHeight(frame) - 152) * 0.08929 + 0.5));
    
    
    //// Rings
    {
        //// Ring1 Drawing
        UIBezierPath* ring1Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(rings) + floor(CGRectGetWidth(rings) * 0.00000 + 0.5), CGRectGetMinY(rings) + floor(CGRectGetHeight(rings) * 0.00000 + 0.5), floor(CGRectGetWidth(rings) * 1.00000 + 0.5) - floor(CGRectGetWidth(rings) * 0.00000 + 0.5), floor(CGRectGetHeight(rings) * 1.00000 + 0.5) - floor(CGRectGetHeight(rings) * 0.00000 + 0.5))];
        [[UIColor whiteColor] setFill];
        [ring1Path fill];
        [color setStroke];
        ring1Path.lineWidth = 2;
        [ring1Path stroke];
        
        
        //// Ring2 Drawing
        UIBezierPath* ring2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(rings) + floor(CGRectGetWidth(rings) * 0.11616) + 0.5, CGRectGetMinY(rings) + floor(CGRectGetHeight(rings) * 0.10943) + 0.5, floor(CGRectGetWidth(rings) * 0.89057) - floor(CGRectGetWidth(rings) * 0.11616), floor(CGRectGetHeight(rings) * 0.88384) - floor(CGRectGetHeight(rings) * 0.10943))];
        [[UIColor whiteColor] setFill];
        [ring2Path fill];
        [color setStroke];
        ring2Path.lineWidth = 2;
        [ring2Path stroke];
        
        
        //// Ring3 Drawing
        UIBezierPath* ring3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(rings) + floor(CGRectGetWidth(rings) * 0.23064) + 0.5, CGRectGetMinY(rings) + floor(CGRectGetHeight(rings) * 0.22727) + 0.5, floor(CGRectGetWidth(rings) * 0.77273) - floor(CGRectGetWidth(rings) * 0.23064), floor(CGRectGetHeight(rings) * 0.76936) - floor(CGRectGetHeight(rings) * 0.22727))];
        [[UIColor whiteColor] setFill];
        [ring3Path fill];
        [color setStroke];
        ring3Path.lineWidth = 2;
        [ring3Path stroke];
        
        
        //// Ring4 Drawing
        UIBezierPath* ring4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(rings) + floor(CGRectGetWidth(rings) * 0.32155) + 0.5, CGRectGetMinY(rings) + floor(CGRectGetHeight(rings) * 0.31818) + 0.5, floor(CGRectGetWidth(rings) * 0.68182) - floor(CGRectGetWidth(rings) * 0.32155), floor(CGRectGetHeight(rings) * 0.67845) - floor(CGRectGetHeight(rings) * 0.31818))];
        [[UIColor whiteColor] setFill];
        [ring4Path fill];
        [color setStroke];
        ring4Path.lineWidth = 2;
        [ring4Path stroke];
        
        
        //// Ring5 Drawing
        UIBezierPath* ring5Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(rings) + floor(CGRectGetWidth(rings) * 0.41246) + 0.5, CGRectGetMinY(rings) + floor(CGRectGetHeight(rings) * 0.40909) + 0.5, floor(CGRectGetWidth(rings) * 0.59091) - floor(CGRectGetWidth(rings) * 0.41246), floor(CGRectGetHeight(rings) * 0.58754) - floor(CGRectGetHeight(rings) * 0.40909))];
        [[UIColor whiteColor] setFill];
        [ring5Path fill];
        [color setStroke];
        ring5Path.lineWidth = 2;
        [ring5Path stroke];
    }
    
    
    //// NW Arm 2
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(nWArm2) + 0.99563 * CGRectGetWidth(nWArm2), CGRectGetMinY(nWArm2) + 0.48586 * CGRectGetHeight(nWArm2))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(nWArm2) + 0.04777 * CGRectGetWidth(nWArm2), CGRectGetMinY(nWArm2) + 0.50000 * CGRectGetHeight(nWArm2))];
        [color setStroke];
        bezierPath.lineWidth = 2;
        [bezierPath stroke];
        
        
//        //// Point5 Drawing
//        UIBezierPath* point5Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(nWArm2) + floor(CGRectGetWidth(nWArm2) * 0.00318) + 0.5, CGRectGetMinY(nWArm2) + floor(CGRectGetHeight(nWArm2) * 0.03333) + 0.5, floor(CGRectGetWidth(nWArm2) * 0.09236) - floor(CGRectGetWidth(nWArm2) * 0.00318), floor(CGRectGetHeight(nWArm2) * 0.96667) - floor(CGRectGetHeight(nWArm2) * 0.03333))];
//        [emptyPointColor setFill];
//        [point5Path fill];
//        [color2 setStroke];
//        point5Path.lineWidth = 2;
//        [point5Path stroke];
//        
//        
//        //// Point4 Drawing
//        UIBezierPath* point4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(nWArm2) + floor(CGRectGetWidth(nWArm2) * 0.21975) + 0.5, CGRectGetMinY(nWArm2) + floor(CGRectGetHeight(nWArm2) * 0.03333) + 0.5, floor(CGRectGetWidth(nWArm2) * 0.30892) - floor(CGRectGetWidth(nWArm2) * 0.21975), floor(CGRectGetHeight(nWArm2) * 0.96667) - floor(CGRectGetHeight(nWArm2) * 0.03333))];
//        [emptyPointColor setFill];
//        [point4Path fill];
//        [color2 setStroke];
//        point4Path.lineWidth = 2;
//        [point4Path stroke];
//        
//        
//        //// Point3 Drawing
//        UIBezierPath* point3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(nWArm2) + floor(CGRectGetWidth(nWArm2) * 0.43631) + 0.5, CGRectGetMinY(nWArm2) + floor(CGRectGetHeight(nWArm2) * 0.03333) + 0.5, floor(CGRectGetWidth(nWArm2) * 0.52548) - floor(CGRectGetWidth(nWArm2) * 0.43631), floor(CGRectGetHeight(nWArm2) * 0.96667) - floor(CGRectGetHeight(nWArm2) * 0.03333))];
//        [emptyPointColor setFill];
//        [point3Path fill];
//        [color2 setStroke];
//        point3Path.lineWidth = 2;
//        [point3Path stroke];
//        
//        
//        //// Point2 Drawing
//        UIBezierPath* point2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(nWArm2) + floor(CGRectGetWidth(nWArm2) * 0.62102) + 0.5, CGRectGetMinY(nWArm2) + floor(CGRectGetHeight(nWArm2) * 0.03333) + 0.5, floor(CGRectGetWidth(nWArm2) * 0.71019) - floor(CGRectGetWidth(nWArm2) * 0.62102), floor(CGRectGetHeight(nWArm2) * 0.96667) - floor(CGRectGetHeight(nWArm2) * 0.03333))];
//        [emptyPointColor setFill];
//        [point2Path fill];
//        [color2 setStroke];
//        point2Path.lineWidth = 2;
//        [point2Path stroke];
//        
//        
//        //// Point1 Drawing
//        UIBezierPath* point1Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(nWArm2) + floor(CGRectGetWidth(nWArm2) * 0.78662) + 0.5, CGRectGetMinY(nWArm2) + floor(CGRectGetHeight(nWArm2) * 0.03333) + 0.5, floor(CGRectGetWidth(nWArm2) * 0.87580) - floor(CGRectGetWidth(nWArm2) * 0.78662), floor(CGRectGetHeight(nWArm2) * 0.96667) - floor(CGRectGetHeight(nWArm2) * 0.03333))];
//        [emptyPointColor setFill];
//        [point1Path fill];
//        [color2 setStroke];
//        point1Path.lineWidth = 2;
//        [point1Path stroke];
    }
    
    

}

@end
