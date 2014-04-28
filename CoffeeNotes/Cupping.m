//
//  Cupping.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/24/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "Cupping.h"

@implementation Cupping

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.cuppingNameOrOrigin    = [aDecoder decodeObjectForKey:@"nameOrOrigin"];
        self.cuppingRoaster         = [aDecoder decodeObjectForKey:@"roaster"];
        self.location               = [aDecoder decodeObjectForKey:@"location"];
        self.cuppingDate            = [aDecoder decodeObjectForKey:@"cuppingDate"];
        self.roastDate              = [aDecoder decodeObjectForKey:@"roastDate"];
        self.brewingMethod          = [aDecoder decodeObjectForKey:@"brewingMethod"];
        self.cuppingRating          = [aDecoder decodeObjectForKey:@"cuppingRating"];
        //        self.image

    }
    
    return self;
}

//-(void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:self.firstName forKey:@"firstName"];
//    
//}
@end
