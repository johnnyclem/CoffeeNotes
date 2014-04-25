//
//  Coffee.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/24/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cupping.h"
#import "TastingWheel.h"


@interface Coffee : NSObject

@property (nonatomic, strong) NSString *nameOrOrigin;
@property (nonatomic, strong) NSString *roaster;
@property (nonatomic, strong) NSNumber *userAverageRating;
//@property (nonatomic, strong) NSMutableArray *cuppings;
@property (nonatomic, strong) TastingWheel *coffeeTastingWheel;

@end
