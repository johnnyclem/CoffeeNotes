//
//  Cupping.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/24/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TastingWheel.h"

@interface Cupping : NSObject

@property (nonatomic, strong) NSString *cuppingNameOrOrigin;
@property (nonatomic, strong) NSString *cuppingRoaster;
@property (nonatomic, strong) NSDate *cuppingDate;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSDate *roastDate;
@property (nonatomic, strong) NSString *brewingMethod;
@property (nonatomic) NSInteger cuppingRating;
@property (nonatomic, strong) UIImage *image;
//@property (nonatomic, strong) TastingWheel *cuppingTastingWheel;
@property (nonatomic, strong) NSString *cuppingNotes;

@end
