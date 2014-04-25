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

@property (nonatomic, strong) NSDate *cuppingDate;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSDate *roastDate;
@property (nonatomic, strong) NSString *brewingMethod;
@property (nonatomic, strong) NSNumber *cuppingRating;
@property (nonatomic, strong) TastingWheel *cuppingTastingWheel;

@end
