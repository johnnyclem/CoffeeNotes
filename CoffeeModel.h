//
//  Coffee.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/24/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CuppingModel.h"
#import "TastingWheel.h"


@interface CoffeeModel : NSObject

@property (nonatomic, strong) NSString *nameOrOrigin;
@property (nonatomic, strong) NSString *roaster;
@property (nonatomic, strong) NSNumber *averageRating;
@property (nonatomic, strong) NSMutableArray *cuppings;
@property (nonatomic, strong) UIImage *mostRecentCoffeeImage;
//@property (nonatomic, strong) TastingWheel *coffeeTastingWheel;

@end
